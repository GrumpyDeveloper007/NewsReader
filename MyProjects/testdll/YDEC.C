/*

+----------------------------------------------------------------------------+
!                                                                            !
!   yDec 1.0  14.Nov.2001                                                    !
!                                                                            !
!   This sourcecode is released to the public domain - no rights reserved    !
!   More info - also about the yEncoding - at:  www.yenc.org                 !
!                                                                            !
!   If you make a portation to another OS then please notify me (TIA)        !
!          archiver@i3w.com    (Questions welcome)                           !
!                                                                            !
!   Juergen Helbing - infstar@infostar.de                                    !
!                                                                            !
!                                                                            !
!   The 'offline' multipart feature has been implemented as a 'BackPack'.    !
!   I'm not really happy about it - it is simply Q&D (quick and dirty).      !
!                                                                            !
+----------------------------------------------------------------------------+

*/


// Includes for Windows-version.  Only used to create a MessageBox

#include <windows.h>
#include <winsock.h>
#include <stdlib.h>
#include <stdio.h>
#include <io.h>
#include <math.h>
#include <signal.h>
// For SOPEN
//#include <share.h>
//#include <fcntl.h>
//#include <sys\stat.h>

//#include <dir.h>
//#include <dos.h>

//#pragma warn -pro


int errors,errparts,errfiles;

int aDsp;
char attname[260];
char attext[260];
unsigned long ad_rescrc;
unsigned long ad_reslen;
int y_size;
int y_line;
int y_part;
char datadir[260];
char ad_desname[260];
char ad_despath[260];
int ad_cleanmode;
int ad_crcmode;

#define print printf
#define eprint printf


// ad_fgetscr  is a functions which simulates 'fgets' but removes CRLF at the line end

char * ad_fgetscr(char * buffer, int maxlen, FILE * fp)
	{
	char * cp;
	char * dp;

	cp=fgets(buffer,maxlen,fp);
	if (cp==NULL) return(NULL);

	dp=strrchr(buffer,'\n');   // Eliminate CRLF
	if (dp) *dp=0;
	dp=strrchr(buffer,'\r');
	if (dp) *dp=0;

	return(cp);

	}



int crc_tab[256] =

{
	0x00000000, 0x77073096, 0xee0e612c, 0x990951ba, 0x076dc419, 0x706af48f, 0xe963a535, 0x9e6495a3,
	0x0edb8832, 0x79dcb8a4, 0xe0d5e91e, 0x97d2d988, 0x09b64c2b, 0x7eb17cbd, 0xe7b82d07, 0x90bf1d91,
	0x1db71064, 0x6ab020f2, 0xf3b97148, 0x84be41de, 0x1adad47d, 0x6ddde4eb, 0xf4d4b551, 0x83d385c7,
	0x136c9856, 0x646ba8c0, 0xfd62f97a, 0x8a65c9ec, 0x14015c4f, 0x63066cd9, 0xfa0f3d63, 0x8d080df5,
	0x3b6e20c8, 0x4c69105e, 0xd56041e4, 0xa2677172, 0x3c03e4d1, 0x4b04d447, 0xd20d85fd, 0xa50ab56b,
	0x35b5a8fa, 0x42b2986c, 0xdbbbc9d6, 0xacbcf940, 0x32d86ce3, 0x45df5c75, 0xdcd60dcf, 0xabd13d59,
	0x26d930ac, 0x51de003a, 0xc8d75180, 0xbfd06116, 0x21b4f4b5, 0x56b3c423, 0xcfba9599, 0xb8bda50f,
	0x2802b89e, 0x5f058808, 0xc60cd9b2, 0xb10be924, 0x2f6f7c87, 0x58684c11, 0xc1611dab, 0xb6662d3d,
	0x76dc4190, 0x01db7106, 0x98d220bc, 0xefd5102a, 0x71b18589, 0x06b6b51f, 0x9fbfe4a5, 0xe8b8d433,
	0x7807c9a2, 0x0f00f934, 0x9609a88e, 0xe10e9818, 0x7f6a0dbb, 0x086d3d2d, 0x91646c97, 0xe6635c01,
	0x6b6b51f4, 0x1c6c6162, 0x856530d8, 0xf262004e, 0x6c0695ed, 0x1b01a57b, 0x8208f4c1, 0xf50fc457,
	0x65b0d9c6, 0x12b7e950, 0x8bbeb8ea, 0xfcb9887c, 0x62dd1ddf, 0x15da2d49, 0x8cd37cf3, 0xfbd44c65,
	0x4db26158, 0x3ab551ce, 0xa3bc0074, 0xd4bb30e2, 0x4adfa541, 0x3dd895d7, 0xa4d1c46d, 0xd3d6f4fb,
	0x4369e96a, 0x346ed9fc, 0xad678846, 0xda60b8d0, 0x44042d73, 0x33031de5, 0xaa0a4c5f, 0xdd0d7cc9,
	0x5005713c, 0x270241aa, 0xbe0b1010, 0xc90c2086, 0x5768b525, 0x206f85b3, 0xb966d409, 0xce61e49f,
	0x5edef90e, 0x29d9c998, 0xb0d09822, 0xc7d7a8b4, 0x59b33d17, 0x2eb40d81, 0xb7bd5c3b, 0xc0ba6cad,
	0xedb88320, 0x9abfb3b6, 0x03b6e20c, 0x74b1d29a, 0xead54739, 0x9dd277af, 0x04db2615, 0x73dc1683,
	0xe3630b12, 0x94643b84, 0x0d6d6a3e, 0x7a6a5aa8, 0xe40ecf0b, 0x9309ff9d, 0x0a00ae27, 0x7d079eb1,
	0xf00f9344, 0x8708a3d2, 0x1e01f268, 0x6906c2fe, 0xf762575d, 0x806567cb, 0x196c3671, 0x6e6b06e7,
	0xfed41b76, 0x89d32be0, 0x10da7a5a, 0x67dd4acc, 0xf9b9df6f, 0x8ebeeff9, 0x17b7be43, 0x60b08ed5,
	0xd6d6a3e8, 0xa1d1937e, 0x38d8c2c4, 0x4fdff252, 0xd1bb67f1, 0xa6bc5767, 0x3fb506dd, 0x48b2364b,
	0xd80d2bda, 0xaf0a1b4c, 0x36034af6, 0x41047a60, 0xdf60efc3, 0xa867df55, 0x316e8eef, 0x4669be79,
	0xcb61b38c, 0xbc66831a, 0x256fd2a0, 0x5268e236, 0xcc0c7795, 0xbb0b4703, 0x220216b9, 0x5505262f,
	0xc5ba3bbe, 0xb2bd0b28, 0x2bb45a92, 0x5cb36a04, 0xc2d7ffa7, 0xb5d0cf31, 0x2cd99e8b, 0x5bdeae1d,
	0x9b64c2b0, 0xec63f226, 0x756aa39c, 0x026d930a, 0x9c0906a9, 0xeb0e363f, 0x72076785, 0x05005713,
	0x95bf4a82, 0xe2b87a14, 0x7bb12bae, 0x0cb61b38, 0x92d28e9b, 0xe5d5be0d, 0x7cdcefb7, 0x0bdbdf21,
	0x86d3d2d4, 0xf1d4e242, 0x68ddb3f8, 0x1fda836e, 0x81be16cd, 0xf6b9265b, 0x6fb077e1, 0x18b74777,
	0x88085ae6, 0xff0f6a70, 0x66063bca, 0x11010b5c, 0x8f659eff, 0xf862ae69, 0x616bffd3, 0x166ccf45,
	0xa00ae278, 0xd70dd2ee, 0x4e048354, 0x3903b3c2, 0xa7672661, 0xd06016f7, 0x4969474d, 0x3e6e77db,
	0xaed16a4a, 0xd9d65adc, 0x40df0b66, 0x37d83bf0, 0xa9bcae53, 0xdebb9ec5, 0x47b2cf7f, 0x30b5ffe9,
	0xbdbdf21c, 0xcabac28a, 0x53b39330, 0x24b4a3a6, 0xbad03605, 0xcdd70693, 0x54de5729, 0x23d967bf,
	0xb3667a2e, 0xc4614ab8, 0x5d681b02, 0x2a6f2b94, 0xb40bbe37, 0xc30c8ea1, 0x5a05df1b, 0x2d02ef8d
}
;

int crc_val;
long crc_anz;

void CrcInit()
	  {
	  crc_val = -1L ;
	  crc_anz=0L;
	  }



void CrcAdd(int c)
	{
	unsigned long ch1,ch2,cc;


	  /* X^32+X^26+X^23+X^22+X^16+X^12+X^11+X^10+X^8+X^7+X^5+X^4+X^2+X^1+X^0 */
	  /* for (i = 0; i < size; i++) */
	  /*      crccode = crc32Tab[(int) ((crccode) ^ (buf[i])) & 0xff] ^  */
	  /*                (((crccode) >> 8) & 0x00FFFFFFL); */
	  /*   return(crccode); */


	 cc= (c) & 0x000000ffL;
	 ch1=(crc_val ^ cc) & 0xffL;
	 ch1=crc_tab[ch1];
	 ch2=(crc_val>>8L) & 0xffffffL;  // Correct version
	 crc_val=ch1 ^ ch2;
	 crc_anz++;
	}


//  hex_to_ulong makes a conversion of an 8 character CRC to an unsigned long value
//  strtol fails for CRCs which start with 89ABCDEF  !

unsigned long hex_to_ulong(char * text)
	{
	unsigned long res;
	unsigned char c;

	if (text==NULL) return(-1);

	res=0;
loop:
	c=*text; text++;
	if ((c>='0')&(c<='9'))
		{
		res=(res<<4)+((long)(c-48) & 0x0F);
		goto loop;
		}
	if ((c>='A')&(c<='F'))
		{
		res=(res<<4)+((long)(c-55) & 0x0F);
		goto loop;
		}
	if ((c>='a')&(c<='f'))
		{
		res=(res<<4)+((long)(c-87) & 0x0F);
		goto loop;
		}
	return(res);
	}


long y_begin;  // Global for missing part management
long y_end;

int yDecode(FILE * fOut, FILE * fIn, long y_line, long y_size,int y_part)
	{
	unsigned char srcbuf[4100];
	unsigned char desbuf[4100];
	unsigned char * srcp;
	unsigned char * desp;
	int deslen;
	int srclen;
	unsigned char c;
	int id;
	char * cp;
	long decolen;
//	long sumlen;
//	int partnr;
	unsigned long crc32;
	char name[260];
	int esize;
	unsigned char * partbuf;
	unsigned char * partptr;
	long partsize;
	long partfree;
	long wlen;
	long flen;

	if (aDsp) print("yDecoder started...\r\n");

	// sumlen=0; partnr=1;

//part_start:
	CrcInit();  // Analyse only CRC per part
	decolen=0;
	deslen=0; desp=desbuf;

	if (y_part)  // This is a multipart message !
		{
		cp=ad_fgetscr((char*) srcbuf,4097,fIn);  // fgets especially with ad_length
		if (cp==NULL)
			{
			eprint("Unexpected eof in yEncoded file\r\n");
			errors++;
			return(1);
			}

		if (aDsp) print("=ypart-line:  %s\r\n",srcbuf);

		if (strncmp((char*) srcbuf,"=ypart ",7))
			{
			eprint("Missing =ypart line in yEncoded multipart message\r\n");
			errors++;
			return(2);
			}
		cp=strstr((char*)srcbuf,"end=");
		if (cp==NULL)
			{
			eprint("Missing end= in yEncoded multipart message\r\n");
			errors++;
			return(2);
			}
		y_end=atol(cp+4);

		cp=strstr((char*)srcbuf,"begin=");
		if (cp==NULL)
			{
			eprint("Missing begin= in yEncoded multipart message\r\n");
			errors++;
			return(2);
			}
		y_begin=atol(cp+6);

		if (aDsp) print("part-begin: %ld\r\n",y_begin);
		if (aDsp) print("part-end  : %ld\r\n",y_end);

		partbuf=malloc(y_end-y_begin+10);  // Allocate a buffer for the part
		partptr=partbuf;
		partsize=y_end-y_begin+1;
		partfree=partsize;
		}

loop:

	cp=ad_fgetscr((char*) srcbuf,4097,fIn);  // fgets especially with ad_length
	if (cp==NULL)
		{
		eprint("Unexpected eof in yEncoded file\r\n");
		errors++;
		return(1);
		}
	if (strncmp((char*) srcbuf,"=yend ",6)==0)
		{
		if (aDsp) print("Endline (%d bytes): %s\r\n",decolen,srcbuf);
		goto end_of_file;
		}
	if (strncmp((char*) srcbuf,"=ybegin ",8)==0)
		{
		eprint("Unexpected =ybegin in yEncoded file\r\n");
		errors++;
		return(1);
		}
	srclen=strlen((char*)srcbuf);
	if (srclen<y_line)
		{
		if (aDsp) print("Last line.\r\n");
		}
	srcp=srcbuf;

loop2:
	c=*srcp; srcp++;
	if (c==0)
		{
		goto loop;  // End of line reached
		}
	if (c == '=')  // The escape character comes in
		{
		c=*srcp; srcp++;
		if (c==0) return(2); // Last char cannot be escape char !
		c=(unsigned char)(c-64);
		}
	c=(unsigned char)(c-42);  // Subtract the secret number
	*desp=c; desp++; deslen++;	decolen++;

	CrcAdd(c);

	if (deslen>=4096)
		{

		if (y_part)  // MultiPart --> to the partbuffer !
			{
			if (deslen>partfree)
				{
				eprint("Partial message corrupt: longer than (end-begin)!\r\n");
				errors++;
				return(11);
				}
			memcpy(partptr,desbuf,deslen);
			partptr=partptr+deslen;
			partfree=partfree-deslen;
			}
		else    // Single part --> directly to target file
			{
			id=fwrite(desbuf,deslen,1,fOut);
			if (id != 1)
				{
				eprint("Error in writing decoded file (code=%d)\r\n",errno);
				errors++;
				return(3);
				}
			}
		deslen=0; desp=desbuf;
		}
	goto loop2;

end_of_file:


	if (deslen>0)  // Empty the last buffer
		{
		if (y_part)
      	{
			if (deslen>partfree)
				{
				eprint("Partial message corrupt: longer than (end-begin)!\r\n");
				errors++;
				return(11);
				}
			memcpy(partptr,desbuf,deslen);
			//partptr=partptr+deslen;
			//partfree=partfree-deslen;
			}
		else    // Single part --> directly to target file
			{
			id=fwrite(desbuf,deslen,1,fOut);
			if (id != 1)
				{
				eprint("Error in writing decoded file (code=%d)\r\n",errno);
				errors++;
				return(3);
				}
			}



//		id=fwrite(desbuf,deslen,1,fOut);
//		if (id != 1)
//			{
//			eprint("Error in writing decoded file (code=%d)\r\n",errno);
//			return(4);
//			}
		}

	cp=strstr((char*) srcbuf,"size=");  // Compare the decoded size to the =yend size
	if (cp)
		{
		esize=atoi(cp+5);
		if (esize != decolen)
			{
			sprintf(name,"%s(size=%ld)",attname,decolen);
			strcpy(attname,name);
			eprint("Corrupt yEnc binary - endsize mismatch (%s%s)\r\n",attname,attext);
			errors++; errfiles++;
			return(0);
			}
		}


	// Check the srcbuf for the CRC
	if (y_part==0)
		{
		cp=strstr((char*)srcbuf,"crc32=");
		if (cp)
			{
			crc32=hex_to_ulong((char*)(cp+6));
			ad_rescrc=crc_val ^ 0xFFFFFFFFl;
			if (aDsp) print("Included CRC: $%08lx - calculated CRC: $%08lx\r\n",crc32,ad_rescrc);
			}
		}
	else
		{
		cp=strstr((char*)srcbuf,"pcrc32=");
		if (cp)
			{
			crc32=hex_to_ulong((char*)(cp+7));
			ad_rescrc=crc_val ^ 0xFFFFFFFFl;
			if (aDsp) print("Included CRC: $%08lx - calculated CRC: $%08lx\r\n",crc32,ad_rescrc);
			}
		}

	if (cp!=NULL)
		{
		if (crc32 != ad_rescrc)
			{
			sprintf(name,"%s(crc=%08lx)",attname,ad_rescrc);
			strcpy(attname,name);
			eprint("Corrupt yEnc binary - CRC mismatch (%s%s)\r\n",attname,attext);
			errors++; errfiles++;
			return(0);
			}
		}

	if (y_part==0)  // Single message
		{
		if ((y_part==0) & (decolen != y_size))
			{
			// eprint("Y-Decoder: Size mismatch - file corrupt.\r\n");

			sprintf(name,"%s(len=%ld)",attname,decolen);
			strcpy(attname,name);
			eprint("Corrupt yEnc binary - size mismatch (%s%s)\r\n",attname,attext);
			errors++; errfiles++;
			return(0);
			}

		ad_reslen=decolen;
		ad_rescrc=crc_val ^ 0xFFFFFFFFl;

		if (aDsp) print("yDecoder: Job done. %ld bytes written. CRC: $%08lx \r\n",decolen,ad_rescrc);
		return(0);
		}

	// Multipart message

	if ((y_part>0) & (decolen != (y_end-y_begin+1)))
		{
		eprint("yDecoder: Part size mismatch - file corrupt.\r\n");
		errors++; errparts++;
		return(6);
		}

	// ----- Special handling for external decoder

	// Now write the decoded part to the target file !

	id=fseek(fOut,y_begin-1,0);
	if (id)
		{
		eprint("Cannot write a part (fseek failed) [reason:%d]\r\n",errno);
		errors++;
		return(12);
		}
	flen=decolen;
	partptr=partbuf;

	if (aDsp) print("Write part to target file (start: %ld, size: %ld)\r\n",y_begin-1,flen);

	while (flen>0)
		{
		wlen=flen;
		if (wlen>8192) wlen=8192;
		id=fwrite(partptr,wlen,1,fOut);

		if (id != 1)
			{
			eprint("Cannot write a part (fwrite failed) [reason:%d]\r\n",errno);
			errors++;
			return(12);
			}
		partptr=partptr+wlen;
		flen=flen-wlen;
		}

	free(partbuf);  // Give the part-buffer back !

	return(0);
	}


int AddPart(char * srcname,long y_begin, long y_end)
	{
	FILE * fSrc;
	FILE * fDes;
	char desname[260];
	char line[1024];
	long a,e;
	int copyrest;
	char * cp;
	int resparts;
	long flen;

	if (aDsp) print("AddPart (%s) [%ld - %ld]\r\n",srcname,y_begin,y_end);


	copyrest=0;
	resparts=0;

	sprintf(desname,"%s.des",srcname);

	fSrc=fopen(srcname,"rb");
	if (fSrc==NULL)
		{
		eprint("AddPart:  Part Info File not found (%s)\r\n",srcname);
		errors++;
		return(-1);
		}
	flen=filelength(fileno(fSrc));
	if (flen==0)  // Already complete
		{
		return(-9);
		}
	fDes=fopen(desname,"wb");
	if (fDes==NULL)
		{
		eprint("AddPart: Cannot create temporary part file (%s) [reason: %d]\r\n",desname,errno);
		fclose(fSrc);
		errors++;
		return(-2);
		}
loop:
	cp=fgets(line,1000,fSrc);
	if (cp==NULL) goto eof1;
	cp=strrchr(line,'\n');
	if (cp) *cp=0;
	cp=strrchr(line,'\r');
	if (cp) *cp=0;

	// print("%s\r\n",line);

	if (copyrest)  // Analysis done - copy rest & done.
		{
		fprintf(fDes,"%s\r\n",line);
		resparts++;
		goto loop;
		}

	a=atol(line);
	if (a==0)
		{
		eprint("Corrupt part-info file (%s)\r\n",line);
		errors++;
		fclose(fSrc); fclose(fDes); return(-3);
		}
	cp=strchr(line,',');
	if (cp==NULL)
		{
		eprint("Corrupt part-info file (%s)\r\n",line);
		errors++;
		fclose(fSrc); fclose(fDes); return(-4);
		}
	e=atol(cp+1);
	//	print("a:%6d, e:%6d\r\n",a,e);

// ----- Case Analysis -----
//	.............[yb--------ye]      (The new, incoming block)
//	1...a****e                       (The old, missing block)
//	2...a********-----e              (***) Newly written missing block
//	3...a********--------------****e
//	.............[yb--------ye]
//	4............a-----e
// 5............a------------e
//	6............a-------------****e
//	.............[yb--------ye]
//	7............................a***e
//	.............[yb--------ye]
//	8................a----e
//	9................a---------****e




	if (a<y_begin)  // A previous section was missed
		{
		if (e<y_begin) // A previous section was missed entirely
			{
			// Case-1
			fprintf(fDes,"%ld,%ld\r\n",a,e);  // --> Keep that entry
			resparts++;
			goto loop;
			}
		if (e<=y_end)  // Rduce the old section
			{
			// Case-2
			fprintf(fDes,"%ld,%ld\r\n",a,y_begin-1);  // --> Reduce that entry
			resparts++;
			goto loop;
			}
		// The new section is splitting the old missing section
			// Case-3
			fprintf(fDes,"%ld,%ld\r\n",a,y_begin-1);  // --> First part
			fprintf(fDes,"%ld,%ld\r\n",y_end+1,e);  // --> First part
			resparts++; resparts++;
			goto loop;
		}

	if (a==y_begin)  // New part matches this segment
		{
		if (e<y_end)   // Just a smaller section was missed
			{
			// case 4
			goto loop;  // Skip this and analyse next
			}
		if (e==y_end)  // This missing section was exactly -> remove it & done.
			{
			// case 5
			copyrest=1; goto loop;
			}
		if (e>y_end)  // The first part was found
			{
			// case-6
			fprintf(fDes,"%ld,%ld\r\n",y_end+1,e);  // Write the rest
			resparts++;
			copyrest=1; goto loop;
			}
		}

	if (a>y_begin)
		{
		if (a>y_end)  // the found section completely in front of this one.
			{
			// Case-7
			fprintf(fDes,"%ld,%ld\r\n",a,e);  // Rewrite it & copy the rest
			resparts++;
			copyrest=1; goto loop;
			}
		if (e<=y_end) // The section was completely found
			{
			// Case-8
			goto loop;  // Analyse the rest
			}
		// The first part of the missing section was found
			// case-9
			fprintf(fDes,"%ld,%ld\r\n",y_end+1,e);  // Reduce it & copy the rest
			resparts++;
			copyrest=1; goto loop;
		}

eof1:
	fclose(fSrc); fclose(fDes);
	remove(srcname);

	rename(desname,srcname);

	return(resparts);
	}




char srcmask[260];

int DecodeFile(char * fname)
	{
	FILE * fIn;
	char line[8200];
	char * cp;
	char filename[260];
	FILE * fOut;
	int id;
	long flen,wlen;
	char filename2[260];

	fIn=fopen(fname,"rb");
	if (fIn==NULL)
		{
		eprint("Cannot open sourcefile (%s) [reason:%d]\r\n",fname,errno);
		errors++;
		return(1);
		}
loop:
	cp=fgets(line,8192,fIn);    // Read source line
	if (cp==NULL) goto eof1;

	cp=strrchr(line,'\n');     // Eliminate CRLF
	if (cp) *cp=0;
	cp=strrchr(line,'\r');
	if (cp) *cp=0;

	if (strncmp(line,"=ybegin ",8)) goto loop;


	if (aDsp) print("\r\nTrigger: %s\r\n",line);

	// Start of a section found

		cp=strstr(line,"name=");
		if (cp==NULL)
			{
			eprint("'name=' not found in =ybegin line. (%s)\r\n",line);
			errors++;
			goto loop;  // Error - filename not found
			}
		strcpy(attname,cp+5);  // Store the filename
		*cp=0; // throw away the filename

		cp=strstr(line,"size=");
		if (cp==NULL)
			{
			eprint("'size=' not found in =ybegin line. (%s)\r\n",line);
			errors++;
			goto loop;  // Error - size not found
			}
		y_size=atol(cp+5);

		cp=strstr(line,"line=");
		if (cp==NULL)
			{
			eprint("'line=' not found in =ybegin line. (%s)\r\n",line);
			errors++;
			goto loop;  // Error - linelength not found
			}
		y_line=atol(cp+5);

		y_part=0;
		cp=strstr(line,"part=");   // Check if this is a multipart message
		if (cp)
			{
			y_part=atol(cp+5);
//			if (y_part != 1) goto loop;   // MUST start with the first part for proper decoding
			}

		// Now we can decode the file -- let's assume that this is a valid file

		attext[0]=0;
		cp=strrchr(attname,'.');
		if (cp)
			{
			strcpy(attext,cp); *cp=0;
			}

		// sprintf(filename,"%s\\decode.tmp",datadir);
		sprintf(filename,"%sdecode.tmp",ad_despath);

	// ----- Special Handling for offline decoder (missing parts or mixed sequence)
	if (y_part)
		{
		sprintf(filename ,"%s%s%s(%ld).tmp",ad_despath,attname,attext,y_size);
		sprintf(filename2,"%s%s%s(%ld).dec",ad_despath,attname,attext,y_size);
		}
	// ----------------------------------------------------------------------


		if (aDsp) print("DesFileName = (%s%s)\r\n",attname,attext);

		// 27-03-2001: Set the filename just in case we cannot decode it
		sprintf(ad_desname,"%s\\%s%s",ad_despath,attname,attext);
		// sprintf(ad_desname,"%s%s",attname,attext);

		// filelen=0;

/*    Not used in standalone decoder

		if (ad_crcmode) CrcInit();
		if (ad_cleanmode)
			{
			ad_cleanmode=2;  // This will prevent us from writing more to the clean buffer
			if (aDsp) print("Begin cleaning...\r\n");
			CrcInit();
			}
*/

		// Check if the target file exists already
		if (y_part)
			{

			fOut=fopen(filename2,"rb");
			if (fOut)
				{
				flen=filelength(fileno(fOut));
				fclose(fOut);
				if (flen==0)
					{
					print("Part#%3d duplicate for finished %s \r\n",y_part,ad_desname);
					goto loop;
					}
				}

			fOut=fopen(filename,"r+b");
			if (fOut)
				{
				flen=filelength(fileno(fOut));
				if (flen==y_size)
					{
					goto already_open;
					}
				else
					{
					fclose(fOut);
					eprint("Size mismatch on target multipart file !(act:%ld, new:%ld) (%s)\r\n",flen,y_size,filename);
					errors++;
					goto abortus;
					}
				}
			else // First time: Create this file & the missing index
				{
				fOut=fopen(filename2,"wb");
				if (fOut==NULL)
					{
					eprint("Cannot create part-info-file (%s)\r\n",filename2);
					errors++;
					goto abortus;
					}
				fprintf(fOut,"%ld,%ld\r\n",1,y_size);  // Everything is missing !
				fclose(fOut);
				}
			}

		fOut=fopen(filename,"w+b");
		if (fOut==NULL)  // Possibly already exists
			{
			eprint("AutoDecode: Cannot create DesFile (%s)\r\n",filename);
			errors++;
			fclose(fIn);
			return(-1);
			// goto loop;
			}

		if (y_part)  // Now create the entire file !
			{
			flen=y_size;
			memset(line,255,8192);
			while (flen>0)
				{
				wlen=flen;
				if (wlen>8192) wlen=8192;
				id=fwrite(line,wlen,1,fOut);
				if (id!=1)
					{
					eprint("Could not create the target file (disk full?)\r\n");
					fclose(fOut);
					fclose(fIn);
					errors++;
					return(-2);
					}
				flen=flen-wlen;
				}
			}
	already_open:

		// Now decode that file !

		id=yDecode(fOut,fIn,y_line,y_size,y_part);
		if (id)
			{
			eprint("yDecode failed (reason: %d)\r\n",id);
			goto abortus;
			}
		sprintf(ad_desname,"%s%s%s",ad_despath,attname,attext); // Create new target name
		if (aDsp) print("yDecode successful\r\n");
		fclose(fOut);

		// ----- Special handling for offline multipart

		if (y_part)  // Now update the 'missing part file'
			{
			id=AddPart(filename2,y_begin,y_end);
			if (id==0)  // All parts done
				{
				print("Complete multipart --> %s\r\n",ad_desname);
				goto rename_it;
				}
			if (id>0)
				{
				print("Part#%3d: %s --> %s\r\n",y_part,fname,ad_desname);
				}
			if (id==(-9))
				{
				print("Part#%3d of finished %s \r\n",y_part,ad_desname);
				}
			}
		if (y_part) goto loop;
		// --------------------------------------------

	rename_it:
		// Now check if the target file exists already
		id=rename(filename,ad_desname);
		if (id)
			{
			if (errno==35)
				{
				eprint("File exists already: (%s)\r\n",ad_desname);
				errors++;
				}
			else
				{
				eprint("Cannot create target file (%s) [reason: %d]\r\n",ad_desname,errno);
				errors++;
				}
			}
		else
			{
			if (y_part==0) print("Decoded:  %s --> %s\r\n",fname,ad_desname);
			if (y_part)    print("Decoded multipart --> %s\r\n",ad_desname);
			}
abortus:
	goto loop;


eof1:
	fclose(fIn);
	return(0);
	}


