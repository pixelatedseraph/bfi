	.file	"mandelbrot.c"
	.text
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB11:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movzbl	tape(%rip), %eax
	movq	%rbp, 8(%rsp)
	cmpb	$-13, %al
	.cfi_offset 6, -24
	je	.L2207
	movzbl	4+tape(%rip), %esi
	leal	(%rax,%rax,4), %edi
	movzbl	6+tape(%rip), %edx
	movb	$0, tape(%rip)
	movzbl	5+tape(%rip), %ecx
	leal	65(%rsi,%rdi), %esi
	movzbl	1+tape(%rip), %edi
	addl	%eax, %edx
	leal	26(%rcx,%rax,2), %ecx
	addl	$13, %edx
	movb	%sil, 4+tape(%rip)
	leal	26(%rdi,%rax,2), %eax
	movb	%cl, 5+tape(%rip)
	movb	%al, 1+tape(%rip)
	movb	%dl, 6+tape(%rip)
.L3:
	addb	$15, 16+tape(%rip)
	vpinsrw	$0, 5+tape(%rip), %xmm0, %xmm0
	vpinsrw	$0, .LC0(%rip), %xmm1, %xmm1
	vpaddb	%xmm1, %xmm0, %xmm0
	leaq	16+tape(%rip), %rax
	vpextrw	$0, %xmm0, 5+tape(%rip)
	jne	.L2147
	jmp	.L5
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L6:
	addq	$9, %rax
.L2147:
	cmpb	$0, (%rax)
	jne	.L6
	movb	$1, (%rax)
	movq	%rax, %rdx
.L7:
	movq	%rdx, %rax
	leaq	-9(%rdx), %rdx
	cmpb	$0, -9(%rax)
	jne	.L7
	decb	9(%rdx)
	jne	.L2147
.L5:
	movb	$1, (%rax)
	jmp	.L9
.L12:
	cmpb	$0, 9(%rax)
	movb	$0, 8(%rax)
	leaq	9(%rax), %rdx
	je	.L11
.L10:
	movq	%rdx, %rax
.L9:
	cmpb	$0, 8(%rax)
	jne	.L12
	cmpb	$0, 9(%rax)
	leaq	9(%rax), %rdx
	jne	.L10
.L11:
	cmpb	$0, -9(%rdx)
	je	.L14
.L15:
	subq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L15
.L14:
	movzbl	1(%rax), %ecx
	movb	$1, 8(%rax)
	leaq	1(%rax), %rdx
	addb	$5, %cl
	movb	%cl, 1(%rax)
	je	.L16
.L19:
	decb	%cl
	movb	%cl, (%rdx)
	je	.L17
	movb	$0, (%rdx)
	addb	%cl, 9(%rdx)
	addq	$9, %rdx
	movzbl	(%rdx), %ecx
	testb	%cl, %cl
	jne	.L19
.L16:
	incb	7(%rdx)
	leaq	17(%rdx), %rax
	incb	34(%rdx)
	cmpb	$0, 17(%rdx)
	je	.L20
.L21:
	subq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L21
.L20:
	movb	$1, 3(%rax)
	leaq	3(%rax), %rdx
.L1170:
	cmpb	$0, 6(%rdx)
	leaq	6(%rdx), %rax
	je	.L23
.L22:
	cmpb	$0, 7(%rax)
	je	.L2208
	movb	$0, 7(%rax)
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L22
.L23:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rcx
	je	.L27
.L28:
	subq	$9, %rcx
	cmpb	$0, (%rcx)
	jne	.L28
.L27:
	movzbl	1(%rcx), %edx
	movb	$1, 7(%rcx)
	leaq	1(%rcx), %rax
	addb	$4, %dl
	movb	%dl, 1(%rcx)
	je	.L29
.L32:
	decb	%dl
	movb	%dl, (%rax)
	je	.L30
	movb	$0, (%rax)
	addb	%dl, 9(%rax)
	addq	$9, %rax
	movzbl	(%rax), %edx
	testb	%dl, %dl
	jne	.L32
.L29:
	incb	6(%rax)
	movl	$7, %edx
	movb	$7, (%rax)
	jmp	.L36
.L2209:
	addb	9(%rax), %dl
	movb	$0, (%rax)
	leaq	9(%rax), %rcx
	movb	%dl, 9(%rax)
	je	.L35
.L34:
	movq	%rcx, %rax
.L36:
	decb	%dl
	movb	%dl, (%rax)
	jne	.L2209
	movzbl	9(%rax), %edx
	leaq	9(%rax), %rcx
	testb	%dl, %dl
	jne	.L34
.L35:
	incb	6(%rcx)
	decq	%rax
	cmpb	$0, -10(%rcx)
	je	.L998
.L38:
	subq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L38
.L998:
	cmpb	$0, 3(%rax)
	leaq	3(%rax), %rbp
	je	.L40
	cmpb	$0, 0(%rbp)
	je	.L1057
	movb	$0, 0(%rbp)
.L1057:
	cmpb	$0, 6(%rbp)
	leaq	6(%rbp), %rax
	je	.L42
.L41:
	movzbl	7(%rax), %edx
	testb	%dl, %dl
	je	.L46
	addb	%dl, 1(%rax)
	movb	$0, 7(%rax)
.L46:
	movzbl	1(%rax), %edx
	testb	%dl, %dl
	je	.L43
	addb	%dl, 7(%rax)
	addb	%dl, 5(%rax)
	addb	%dl, 2(%rax)
	addq	$9, %rax
	movb	$0, -8(%rax)
	cmpb	$0, (%rax)
	jne	.L41
.L42:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L47
.L48:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L48
.L47:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L50
.L49:
	movzbl	8(%rax), %edx
	testb	%dl, %dl
	je	.L54
	addb	%dl, 1(%rax)
	movb	$0, 8(%rax)
.L54:
	movzbl	1(%rax), %edx
	testb	%dl, %dl
	je	.L51
	addb	%dl, 8(%rax)
	addb	%dl, 6(%rax)
	addb	%dl, 3(%rax)
	addq	$9, %rax
	movb	$0, -8(%rax)
	cmpb	$0, (%rax)
	jne	.L49
.L50:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L55
.L56:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L56
.L55:
	movzbl	7(%rdx), %eax
	testb	%al, %al
	je	.L57
	addb	%al, (%rdx)
	movb	$0, 7(%rdx)
.L57:
	movzbl	(%rdx), %eax
	testb	%al, %al
	je	.L58
	addb	%al, 7(%rdx)
	addb	%al, 5(%rdx)
	movb	$0, (%rdx)
.L58:
	addb	$15, 9(%rdx)
	leaq	9(%rdx), %rax
	jne	.L2149
	jmp	.L60
.L61:
	addq	$9, %rax
.L2149:
	cmpb	$0, (%rax)
	jne	.L61
	cmpb	$0, 1(%rax)
	movb	$1, (%rax)
	je	.L62
	movb	$0, 1(%rax)
.L62:
	cmpb	$0, 2(%rax)
	je	.L63
	movb	$0, 2(%rax)
.L63:
	cmpb	$0, 3(%rax)
	je	.L64
	movb	$0, 3(%rax)
.L64:
	cmpb	$0, 4(%rax)
	je	.L65
	movb	$0, 4(%rax)
.L65:
	cmpb	$0, 5(%rax)
	je	.L66
	movb	$0, 5(%rax)
.L66:
	cmpb	$0, 6(%rax)
	je	.L67
	movb	$0, 6(%rax)
.L67:
	cmpb	$0, 7(%rax)
	je	.L68
	movb	$0, 7(%rax)
.L68:
	cmpb	$0, 8(%rax)
	je	.L69
	movb	$0, 8(%rax)
.L69:
	cmpb	$0, 9(%rax)
	je	.L70
	movb	$0, 9(%rax)
.L70:
	movq	%rax, %rdx
.L71:
	movq	%rdx, %rax
	leaq	-9(%rdx), %rdx
	cmpb	$0, -9(%rax)
	jne	.L71
	decb	9(%rdx)
	jne	.L2149
.L60:
	movb	$1, (%rax)
.L73:
	incb	1(%rax)
	movq	%rax, %rdx
	leaq	9(%rax), %rax
	cmpb	$0, 9(%rdx)
	jne	.L73
	cmpb	$0, -9(%rax)
	je	.L74
.L75:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L75
.L74:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L76
	movq	%rbx, (%rsp)
	.cfi_offset 3, -32
.L95:
	movzbl	1(%rax), %ebx
	movzbl	5(%rax), %edx
	leal	-1(%rbx), %ecx
	movb	%cl, 1(%rax)
	testb	%dl, %dl
	je	.L77
	addl	%ecx, %edx
	movb	$0, 5(%rax)
	movb	%dl, 1(%rax)
.L77:
	movzbl	1(%rax), %edx
	testb	%dl, %dl
	je	.L78
	decl	%edx
	incb	5(%rax)
	movb	%dl, 1(%rax)
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L79
.L83:
	movzbl	2(%rax), %ecx
	decl	%edx
	movb	%dl, (%rax)
	testb	%cl, %cl
	je	.L80
	addl	%edx, %ecx
	movb	$0, 2(%rax)
	movb	%cl, (%rax)
.L80:
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L81
	addb	%dl, 2(%rax)
	addb	%dl, 4(%rax)
.L81:
	movb	$1, (%rax)
	addq	$9, %rax
	movzbl	(%rax), %edx
	testb	%dl, %dl
	jne	.L83
.L79:
	cmpb	$0, -8(%rax)
	leaq	-8(%rax), %rdx
	je	.L84
.L85:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L85
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	jne	.L87
.L86:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L89
.L88:
	movzbl	1(%rdx), %eax
	testb	%al, %al
	je	.L2210
	addb	%al, 10(%rdx)
	subq	$9, %rdx
	movb	$0, 10(%rdx)
	cmpb	$0, (%rdx)
	jne	.L88
.L89:
	movzbl	1(%rdx), %eax
	testb	%al, %al
	je	.L93
.L2215:
	addb	%al, 10(%rdx)
	movl	$1, %r9d
	leaq	8(%rdx), %rax
	cmpb	$0, 8(%rdx)
	movw	%r9w, (%rdx)
	jne	.L95
	movq	(%rsp), %rbx
	.cfi_restore 3
.L76:
	leaq	-9(%rax), %rdx
	movzbl	-9(%rax), %eax
	testb	%al, %al
	je	.L97
.L96:
	cmpb	$0, 1(%rdx)
	je	.L108
	movb	$0, 1(%rdx)
.L108:
	movzbl	4(%rdx), %ecx
	decl	%eax
	movb	%al, (%rdx)
	testb	%cl, %cl
	je	.L98
.L104:
	movzbl	1(%rdx), %esi
	decl	%ecx
	incl	%eax
	testb	%sil, %sil
	je	.L100
	addb	%sil, -5(%rdx)
	movb	$0, 1(%rdx)
	subb	%sil, %al
	je	.L101
.L100:
	addb	%al, 1(%rdx)
	testb	%cl, %cl
	je	.L103
.L102:
	xorl	%eax, %eax
	jmp	.L104
.L17:
	movzbl	9(%rdx), %ecx
	addq	$9, %rdx
	testb	%cl, %cl
	jne	.L19
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L2208:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L22
	jmp	.L23
.L30:
	movzbl	9(%rax), %edx
	addq	$9, %rax
	testb	%dl, %dl
	jne	.L32
	jmp	.L29
.L40:
	movsbl	-4(%rbp), %edi
	movq	stdout(%rip), %rsi
	call	putc@PLT
	cmpb	$0, 6(%rbp)
	leaq	6(%rbp), %rax
	je	.L1059
.L1058:
	cmpb	$0, 6(%rax)
	je	.L2211
	movb	$0, 6(%rax)
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L1058
.L1059:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rcx
	je	.L1063
.L1064:
	subq	$9, %rcx
	cmpb	$0, (%rcx)
	jne	.L1064
.L1063:
	movzbl	1(%rcx), %eax
	leaq	1(%rcx), %rdx
	addb	$10, %al
	movb	%al, 1(%rcx)
	je	.L1065
.L1068:
	decb	%al
	movb	%al, (%rdx)
	je	.L1066
	movb	$0, (%rdx)
	addb	%al, 9(%rdx)
	addq	$9, %rdx
	movzbl	(%rdx), %eax
	testb	%al, %al
	jne	.L1068
.L1065:
	incb	5(%rdx)
	leaq	-1(%rdx), %rax
	incb	14(%rdx)
	cmpb	$0, -1(%rdx)
	je	.L1069
.L1070:
	subq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L1070
.L1069:
	movzbl	8(%rax), %edx
	testb	%dl, %dl
	je	.L1071
	addb	%dl, (%rax)
	movb	$0, 8(%rax)
.L1071:
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L1072
	decl	%edx
	cmpb	$0, 9(%rax)
	movb	$0, 8(%rax)
	movb	%dl, (%rax)
	leaq	9(%rax), %rdx
	je	.L1073
.L1074:
	addq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L1074
.L1073:
	cmpb	$0, -9(%rdx)
	leaq	-9(%rdx), %rax
	je	.L1076
.L1075:
	movzbl	8(%rax), %edx
	testb	%dl, %dl
	je	.L1082
	addb	%dl, 1(%rax)
	movb	$0, 8(%rax)
.L1082:
	leaq	1(%rax), %rdx
	movzbl	1(%rax), %eax
	testb	%al, %al
	je	.L1077
.L1080:
	decl	%eax
	incb	7(%rdx)
	cmpb	$0, -1(%rdx)
	movb	%al, (%rdx)
	leaq	-1(%rdx), %rax
	je	.L1078
.L1079:
	subq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L1079
.L1078:
	movb	$1, 8(%rax)
	leaq	10(%rax), %rdx
	movzbl	10(%rax), %eax
	testb	%al, %al
	jne	.L1080
.L1077:
	cmpb	$0, -10(%rdx)
	leaq	-10(%rdx), %rax
	jne	.L1075
.L1076:
	movzbl	8(%rax), %edx
	testb	%dl, %dl
	je	.L2188
.L1178:
	addb	%dl, (%rax)
	movb	$0, 8(%rax)
.L2188:
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L1084
	decl	%edx
	incb	8(%rax)
	cmpb	$0, 9(%rax)
	movb	%dl, (%rax)
	leaq	9(%rax), %rdx
	je	.L1085
.L1089:
	movzbl	1(%rdx), %eax
	movzbl	6(%rdx), %ecx
	incl	%eax
	movb	%al, 1(%rdx)
	testb	%cl, %cl
	je	.L1086
	subl	%ecx, %eax
	movb	$0, 6(%rdx)
	movb	%al, 1(%rdx)
.L1086:
	movzbl	1(%rdx), %eax
	testb	%al, %al
	je	.L1087
	addb	%al, 6(%rdx)
	addq	$9, %rdx
	movb	$0, -8(%rdx)
	cmpb	$0, (%rdx)
	jne	.L1089
.L1085:
	incb	-1(%rdx)
	cmpb	$0, -9(%rdx)
	leaq	-9(%rdx), %rax
	je	.L1091
.L1090:
	movzbl	6(%rax), %edx
	testb	%dl, %dl
	je	.L2212
	addb	%dl, 8(%rax)
	subq	$9, %rax
	movb	$0, 15(%rax)
	cmpb	$0, (%rax)
	jne	.L1090
.L1091:
	cmpb	$0, 9(%rax)
	leaq	9(%rax), %rdx
	je	.L1095
.L1096:
	addq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L1096
.L1095:
	leaq	-9(%rdx), %rax
	movzbl	-9(%rdx), %edx
	testb	%dl, %dl
	je	.L1098
.L1097:
	cmpb	$0, 1(%rax)
	je	.L1109
	movb	$0, 1(%rax)
.L1109:
	movzbl	8(%rax), %ecx
	decl	%edx
	movb	%dl, (%rax)
	testb	%cl, %cl
	je	.L1099
.L1105:
	movzbl	1(%rax), %esi
	decl	%ecx
	incl	%edx
	testb	%sil, %sil
	je	.L1101
	addb	%sil, -1(%rax)
	movb	$0, 1(%rax)
	subb	%sil, %dl
	je	.L1102
.L1101:
	addb	%dl, 1(%rax)
	testb	%cl, %cl
	je	.L1104
.L1103:
	xorl	%edx, %edx
	jmp	.L1105
.L43:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L41
	jmp	.L42
.L51:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L49
	jmp	.L50
.L2211:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L1058
	jmp	.L1059
.L1066:
	movzbl	9(%rdx), %eax
	addq	$9, %rdx
	testb	%al, %al
	jne	.L1068
	jmp	.L1065
.L78:
	.cfi_offset 3, -32
	leaq	1(%rax), %rdx
.L84:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L86
.L87:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L87
	jmp	.L86
.L101:
	.cfi_restore 3
	testb	%cl, %cl
	jne	.L102
.L103:
	movb	$0, (%rdx)
	movb	$0, 4(%rdx)
.L98:
	movzbl	1(%rdx), %eax
	testb	%al, %al
	je	.L105
	addb	%al, 4(%rdx)
	movb	$0, 1(%rdx)
.L105:
	incb	(%rdx)
	subq	$9, %rdx
	movzbl	(%rdx), %eax
	testb	%al, %al
	jne	.L96
.L97:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L109
.L110:
	incb	1(%rax)
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L110
.L109:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L111
.L112:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L112
.L111:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L113
	movq	%rbx, (%rsp)
	.cfi_offset 3, -32
.L132:
	movzbl	1(%rax), %ebx
	movzbl	6(%rax), %edx
	leal	-1(%rbx), %ecx
	movb	%cl, 1(%rax)
	testb	%dl, %dl
	je	.L114
	addl	%ecx, %edx
	movb	$0, 6(%rax)
	movb	%dl, 1(%rax)
.L114:
	movzbl	1(%rax), %edx
	testb	%dl, %dl
	je	.L115
	decl	%edx
	incb	6(%rax)
	movb	%dl, 1(%rax)
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L116
.L120:
	movzbl	3(%rax), %ecx
	decl	%edx
	movb	%dl, (%rax)
	testb	%cl, %cl
	je	.L117
	addl	%edx, %ecx
	movb	$0, 3(%rax)
	movb	%cl, (%rax)
.L117:
	movzbl	(%rax), %esi
	testb	%sil, %sil
	je	.L118
	movzbl	3(%rax), %edx
	movzbl	%sil, %ecx
	movl	%esi, %ebx
	movb	4(%rax), %ch
	movb	%bl, %dh
	addb	%cl, %dl
	addb	%ch, %dh
	movw	%dx, 3(%rax)
.L118:
	movb	$1, (%rax)
	addq	$9, %rax
	movzbl	(%rax), %edx
	testb	%dl, %dl
	jne	.L120
.L116:
	cmpb	$0, -8(%rax)
	leaq	-8(%rax), %rdx
	je	.L121
.L122:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L122
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	jne	.L124
.L123:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L126
.L125:
	movzbl	2(%rdx), %eax
	testb	%al, %al
	je	.L2213
	addb	%al, 11(%rdx)
	subq	$9, %rdx
	movb	$0, 11(%rdx)
	cmpb	$0, (%rdx)
	jne	.L125
.L126:
	movzbl	2(%rdx), %eax
	testb	%al, %al
	je	.L130
.L2220:
	addb	%al, 11(%rdx)
	cmpb	$0, 8(%rdx)
	leaq	8(%rdx), %rax
	movb	$0, 2(%rdx)
	movb	$1, (%rdx)
	jne	.L132
	movq	(%rsp), %rbx
	.cfi_restore 3
.L113:
	leaq	-9(%rax), %rdx
	movzbl	-9(%rax), %eax
	testb	%al, %al
	je	.L134
.L133:
	cmpb	$0, 1(%rdx)
	je	.L145
	movb	$0, 1(%rdx)
.L145:
	movzbl	4(%rdx), %ecx
	decl	%eax
	movb	%al, (%rdx)
	testb	%cl, %cl
	je	.L135
.L141:
	movzbl	1(%rdx), %esi
	decl	%ecx
	incl	%eax
	testb	%sil, %sil
	je	.L137
	addb	%sil, -5(%rdx)
	movb	$0, 1(%rdx)
	subb	%sil, %al
	je	.L138
.L137:
	addb	%al, 1(%rdx)
	testb	%cl, %cl
	je	.L140
.L139:
	xorl	%eax, %eax
	jmp	.L141
.L1087:
	addq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L1089
	jmp	.L1085
.L2212:
	subq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L1090
	jmp	.L1091
.L1072:
	movzbl	8(%rax), %edx
	testb	%dl, %dl
	jne	.L1178
.L1084:
	movzbl	8(%rax), %esi
	movl	$1, %ecx
	movb	$1, 8(%rax)
	movl	%ecx, %edx
	subl	%esi, %edx
	testb	%sil, %sil
	cmove	%ecx, %edx
	movb	%dl, (%rax)
	testb	%dl, %dl
	je	.L1112
	decl	%edx
	cmpb	$0, 9(%rax)
	movb	$0, 8(%rax)
	movb	%dl, (%rax)
	leaq	9(%rax), %rdx
	je	.L1114
.L1113:
	movzbl	6(%rdx), %eax
	testb	%al, %al
	je	.L2214
	addb	%al, 8(%rdx)
	addq	$9, %rdx
	movb	$0, -3(%rdx)
	cmpb	$0, (%rdx)
	jne	.L1113
.L1114:
	leaq	-9(%rdx), %rax
	movzbl	-9(%rdx), %edx
	testb	%dl, %dl
	je	.L1119
.L1118:
	cmpb	$0, 1(%rax)
	je	.L1130
	movb	$0, 1(%rax)
.L1130:
	movzbl	8(%rax), %ecx
	decl	%edx
	movb	%dl, (%rax)
	testb	%cl, %cl
	je	.L1120
.L1126:
	movzbl	1(%rax), %esi
	decl	%ecx
	incl	%edx
	testb	%sil, %sil
	je	.L1122
	addb	%sil, -1(%rax)
	movb	$0, 1(%rax)
	subb	%sil, %dl
	je	.L1123
.L1122:
	addb	%dl, 1(%rax)
	testb	%cl, %cl
	je	.L1125
.L1124:
	xorl	%edx, %edx
	jmp	.L1126
.L2210:
	.cfi_offset 3, -32
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L88
	movzbl	1(%rdx), %eax
	testb	%al, %al
	jne	.L2215
.L93:
	cmpb	$0, 8(%rdx)
	movb	$1, (%rdx)
	leaq	8(%rdx), %rax
	jne	.L95
	movq	(%rsp), %rbx
	.cfi_remember_state
	.cfi_restore 3
	jmp	.L76
.L115:
	.cfi_restore_state
	leaq	1(%rax), %rdx
.L121:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L123
.L124:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L124
	jmp	.L123
.L138:
	.cfi_restore 3
	testb	%cl, %cl
	jne	.L139
.L140:
	movb	$0, (%rdx)
	movb	$0, 4(%rdx)
.L135:
	movzbl	1(%rdx), %eax
	testb	%al, %al
	je	.L142
	addb	%al, 4(%rdx)
	movb	$0, 1(%rdx)
.L142:
	incb	(%rdx)
	subq	$9, %rdx
	movzbl	(%rdx), %eax
	testb	%al, %al
	jne	.L133
.L134:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L147
.L146:
	movzbl	4(%rax), %edx
	testb	%dl, %dl
	je	.L2216
	addb	%dl, -32(%rax)
	addq	$9, %rax
	movb	$0, -5(%rax)
	cmpb	$0, (%rax)
	jne	.L146
.L147:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L151
.L152:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L152
.L151:
	addb	$15, 9(%rdx)
	leaq	9(%rdx), %rax
	jne	.L2153
	jmp	.L154
.L155:
	addq	$9, %rax
.L2153:
	cmpb	$0, (%rax)
	jne	.L155
	decb	-9(%rax)
	cmpb	$0, -18(%rax)
	leaq	-18(%rax), %rdx
	je	.L156
.L157:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L157
.L156:
	decb	9(%rdx)
	leaq	9(%rdx), %rax
	jne	.L2153
.L154:
	incb	21(%rax)
	cmpb	$0, 18(%rax)
	leaq	18(%rax), %rdx
	movb	$1, (%rax)
	je	.L159
.L160:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L160
.L159:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	movl	$1, %ecx
	je	.L162
.L161:
	movzbl	3(%rax), %edx
	testb	%dl, %dl
	je	.L185
	subb	%dl, (%rax)
.L185:
	movzbl	(%rax), %edx
	movb	$1, 3(%rax)
	testb	%dl, %dl
	je	.L166
	movzbl	4(%rax), %esi
	decl	%edx
	movb	$0, 3(%rax)
	movb	%dl, (%rax)
	testb	%sil, %sil
	je	.L2154
	addl	%edx, %esi
	movb	$0, 4(%rax)
	movb	%sil, (%rax)
.L2154:
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L166
.L165:
	decl	%edx
	incb	4(%rax)
	cmpb	$0, -9(%rax)
	movb	%dl, (%rax)
	leaq	-9(%rax), %rdx
	je	.L167
.L168:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L168
.L167:
	cmpb	$0, 9(%rdx)
	movb	$1, 4(%rdx)
	leaq	9(%rdx), %rax
	je	.L169
.L170:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L170
.L169:
	movzbl	(%rax), %edx
	incb	1(%rax)
	testb	%dl, %dl
	jne	.L165
.L166:
	movzbl	4(%rax), %esi
	movl	%ecx, %edx
	movb	$1, 4(%rax)
	subl	%esi, %edx
	testb	%sil, %sil
	cmove	%ecx, %edx
	movb	%dl, (%rax)
	testb	%dl, %dl
	je	.L175
	movzbl	3(%rax), %esi
	decl	%edx
	movb	$0, 4(%rax)
	movb	%dl, (%rax)
	testb	%sil, %sil
	je	.L2155
	addl	%edx, %esi
	movb	$0, 3(%rax)
	movb	%sil, (%rax)
.L2155:
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L175
.L174:
	decl	%edx
	incb	3(%rax)
	cmpb	$0, -9(%rax)
	movb	%dl, (%rax)
	leaq	-9(%rax), %rdx
	je	.L176
.L177:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L177
.L176:
	cmpb	$0, 9(%rdx)
	movb	$1, 3(%rdx)
	leaq	9(%rdx), %rax
	je	.L178
.L179:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L179
.L178:
	movzbl	(%rax), %edx
	movb	$1, 1(%rax)
	testb	%dl, %dl
	jne	.L174
.L175:
	movb	$1, (%rax)
	leaq	1(%rax), %rdx
	movzbl	1(%rax), %eax
	testb	%al, %al
	je	.L180
.L183:
	decl	%eax
	cmpb	$0, -1(%rdx)
	movb	%al, (%rdx)
	leaq	-1(%rdx), %rax
	je	.L181
.L182:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L182
.L181:
	leaq	-8(%rax), %rdx
	movzbl	-8(%rax), %eax
	testb	%al, %al
	jne	.L183
.L180:
	cmpb	$0, 8(%rdx)
	leaq	8(%rdx), %rax
	jne	.L161
.L162:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L186
.L187:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L187
.L186:
	movzbl	-7(%rdx), %eax
	testb	%al, %al
	je	.L188
	addb	%al, -6(%rdx)
	subb	%al, -3(%rdx)
	movb	$0, -7(%rdx)
.L188:
	movzbl	4(%rdx), %eax
	addb	$26, 2(%rdx)
	testb	%al, %al
	je	.L189
	addb	%al, (%rdx)
	movb	$0, 4(%rdx)
.L189:
	movzbl	(%rdx), %eax
	testb	%al, %al
	je	.L190
	leal	-1(%rax), %ecx
	addb	4(%rdx), %al
	movl	%eax, %esi
	subl	%ecx, %esi
	cmpb	$0, 2(%rdx)
	je	.L2217
.L191:
	movb	$0, 2(%rdx)
	testb	%cl, %cl
	je	.L193
	decl	%ecx
	movl	%eax, %esi
	subl	%ecx, %esi
	cmpb	$0, 2(%rdx)
	jne	.L191
.L2217:
	testb	%cl, %cl
	cmovne	%eax, %esi
.L193:
	movb	%sil, 4(%rdx)
	movb	$0, (%rdx)
.L190:
	cmpb	$0, 2(%rdx)
	leaq	2(%rdx), %rbp
	je	.L195
	movl	$1, %ecx
.L921:
	movzbl	-8(%rbp), %eax
	incb	-7(%rbp)
	leaq	-8(%rbp), %rdx
	testb	%al, %al
	je	.L196
	decl	%eax
	movb	%al, -8(%rbp)
	incb	-1(%rdx)
	incb	3(%rdx)
	leaq	-7(%rbp), %rdx
	cmpb	$0, -7(%rbp)
	je	.L196
	movb	$0, -7(%rbp)
.L196:
	leaq	1(%rdx), %rax
	movzbl	1(%rdx), %edx
	testb	%dl, %dl
	je	.L198
.L201:
	decl	%edx
	movb	%dl, (%rax)
	movzbl	-2(%rax), %edx
	testb	%dl, %dl
	je	.L199
	addb	%dl, -1(%rax)
	subb	%dl, 2(%rax)
	incq	%rax
	movb	$0, -3(%rax)
	movzbl	(%rax), %edx
	testb	%dl, %dl
	jne	.L201
.L198:
	cmpb	$0, 13(%rax)
	leaq	13(%rax), %rdx
	je	.L203
.L202:
	cmpb	$0, 2(%rdx)
	je	.L208
	movb	$0, 2(%rdx)
.L208:
	cmpb	$0, 3(%rdx)
	je	.L204
	movb	$0, 3(%rdx)
.L204:
	cmpb	$0, 4(%rdx)
	je	.L205
	movb	$0, 4(%rdx)
	addq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L202
.L203:
	cmpb	$0, -9(%rdx)
	leaq	-9(%rdx), %rsi
	je	.L209
.L210:
	subq	$9, %rsi
	cmpb	$0, (%rsi)
	jne	.L210
.L209:
	cmpb	$0, 3(%rsi)
	je	.L211
	movb	$0, 3(%rsi)
.L211:
	cmpb	$0, 9(%rsi)
	leaq	9(%rsi), %rax
	je	.L213
.L212:
	movzbl	5(%rax), %edx
	testb	%dl, %dl
	je	.L217
	addb	%dl, 1(%rax)
	movb	$0, 5(%rax)
.L217:
	movzbl	1(%rax), %edx
	testb	%dl, %dl
	je	.L214
	addb	%dl, 5(%rax)
	addb	%dl, 2(%rax)
	addq	$9, %rax
	movb	$0, -8(%rax)
	cmpb	$0, (%rax)
	jne	.L212
.L213:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L218
.L219:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L219
.L218:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L221
.L220:
	movzbl	2(%rax), %edx
	testb	%dl, %dl
	je	.L2218
	addb	%dl, -7(%rax)
	addq	$9, %rax
	movb	$0, -7(%rax)
	cmpb	$0, (%rax)
	jne	.L220
.L221:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L225
.L226:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L226
.L225:
	addb	$15, 9(%rdx)
	leaq	9(%rdx), %rax
	jne	.L2157
	jmp	.L228
.L229:
	addq	$9, %rax
.L2157:
	cmpb	$0, (%rax)
	jne	.L229
	cmpb	$0, 1(%rax)
	movb	$1, (%rax)
	je	.L230
	movb	$0, 1(%rax)
.L230:
	cmpb	$0, 2(%rax)
	je	.L231
	movb	$0, 2(%rax)
.L231:
	cmpb	$0, 3(%rax)
	je	.L232
	movb	$0, 3(%rax)
.L232:
	cmpb	$0, 4(%rax)
	je	.L233
	movb	$0, 4(%rax)
.L233:
	cmpb	$0, 5(%rax)
	je	.L234
	movb	$0, 5(%rax)
.L234:
	cmpb	$0, 6(%rax)
	je	.L235
	movb	$0, 6(%rax)
.L235:
	cmpb	$0, 7(%rax)
	je	.L236
	movb	$0, 7(%rax)
.L236:
	cmpb	$0, 8(%rax)
	je	.L237
	movb	$0, 8(%rax)
.L237:
	cmpb	$0, 9(%rax)
	je	.L238
	movb	$0, 9(%rax)
.L238:
	movq	%rax, %rdx
.L239:
	movq	%rdx, %rax
	leaq	-9(%rdx), %rdx
	cmpb	$0, -9(%rax)
	jne	.L239
	decb	9(%rdx)
	jne	.L2157
.L228:
	movb	$1, (%rax)
.L241:
	incb	1(%rax)
	movq	%rax, %rdx
	leaq	9(%rax), %rax
	cmpb	$0, 9(%rdx)
	jne	.L241
	cmpb	$0, -9(%rax)
	je	.L242
.L243:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L243
.L242:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L244
	movq	%rbx, (%rsp)
	.cfi_offset 3, -32
.L263:
	movzbl	1(%rax), %ebx
	movzbl	6(%rax), %edx
	leal	-1(%rbx), %esi
	movb	%sil, 1(%rax)
	testb	%dl, %dl
	je	.L245
	addl	%esi, %edx
	movb	$0, 6(%rax)
	movb	%dl, 1(%rax)
.L245:
	movzbl	1(%rax), %edx
	testb	%dl, %dl
	je	.L246
	decl	%edx
	incb	6(%rax)
	movb	%dl, 1(%rax)
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L247
.L251:
	movzbl	2(%rax), %esi
	decl	%edx
	movb	%dl, (%rax)
	testb	%sil, %sil
	je	.L248
	addl	%edx, %esi
	movb	$0, 2(%rax)
	movb	%sil, (%rax)
.L248:
	movzbl	(%rax), %esi
	testb	%sil, %sil
	je	.L249
	movzbl	%sil, %edx
	movl	%esi, %ebx
	vpinsrw	$0, 2(%rax), %xmm0, %xmm0
	movb	%bl, %dh
	vmovd	%edx, %xmm2
	vpaddb	%xmm2, %xmm0, %xmm0
	vpextrw	$0, %xmm0, 2(%rax)
.L249:
	movb	$1, (%rax)
	addq	$9, %rax
	movzbl	(%rax), %edx
	testb	%dl, %dl
	jne	.L251
.L247:
	cmpb	$0, -8(%rax)
	leaq	-8(%rax), %rdx
	je	.L252
.L253:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L253
.L252:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L254
.L255:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L255
.L254:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L257
.L256:
	movzbl	1(%rdx), %eax
	testb	%al, %al
	je	.L2219
	addb	%al, 10(%rdx)
	subq	$9, %rdx
	movb	$0, 10(%rdx)
	cmpb	$0, (%rdx)
	jne	.L256
.L257:
	movzbl	1(%rdx), %eax
	testb	%al, %al
	je	.L261
.L2227:
	addb	%al, 10(%rdx)
	movl	$1, %r8d
	leaq	8(%rdx), %rax
	cmpb	$0, 8(%rdx)
	movw	%r8w, (%rdx)
	jne	.L263
	movq	(%rsp), %rbx
	.cfi_restore 3
.L244:
	leaq	-9(%rax), %rdx
	movzbl	-9(%rax), %eax
	testb	%al, %al
	je	.L265
.L264:
	cmpb	$0, 1(%rdx)
	je	.L276
	movb	$0, 1(%rdx)
.L276:
	movzbl	3(%rdx), %esi
	decl	%eax
	movb	%al, (%rdx)
	testb	%sil, %sil
	je	.L266
.L272:
	movzbl	1(%rdx), %edi
	decl	%esi
	incl	%eax
	testb	%dil, %dil
	je	.L268
	addb	%dil, -6(%rdx)
	movb	$0, 1(%rdx)
	subb	%dil, %al
	je	.L269
.L268:
	addb	%al, 1(%rdx)
	testb	%sil, %sil
	je	.L271
.L270:
	xorl	%eax, %eax
	jmp	.L272
.L2216:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L146
	jmp	.L147
.L2213:
	.cfi_offset 3, -32
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L125
	movzbl	2(%rdx), %eax
	testb	%al, %al
	jne	.L2220
.L130:
	cmpb	$0, 8(%rdx)
	movb	$1, (%rdx)
	leaq	8(%rdx), %rax
	jne	.L132
	movq	(%rsp), %rbx
	.cfi_restore 3
	jmp	.L113
.L1102:
	testb	%cl, %cl
	jne	.L1103
.L1104:
	movb	$0, (%rax)
	movb	$0, 8(%rax)
.L1099:
	movzbl	1(%rax), %edx
	testb	%dl, %dl
	je	.L1106
	addb	%dl, 8(%rax)
	movb	$0, 1(%rax)
.L1106:
	incb	(%rax)
	subq	$9, %rax
	movzbl	(%rax), %edx
	testb	%dl, %dl
	jne	.L1097
.L1098:
	decb	8(%rax)
	movb	$1, 3(%rax)
	jmp	.L2188
.L2214:
	addq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L1113
	leaq	-9(%rdx), %rax
	movzbl	-9(%rdx), %edx
	testb	%dl, %dl
	jne	.L1118
.L1119:
	movzbl	1(%rax), %ecx
	leaq	1(%rax), %rdx
	addb	$5, %cl
	movb	%cl, 1(%rax)
	je	.L1131
.L1134:
	decb	%cl
	movb	%cl, (%rdx)
	je	.L1132
	movb	$0, (%rdx)
	addb	%cl, 9(%rdx)
	addq	$9, %rdx
	movzbl	(%rdx), %ecx
	testb	%cl, %cl
	jne	.L1134
.L1131:
	incb	5(%rdx)
	leaq	26(%rdx), %rsi
	incb	32(%rdx)
	cmpb	$0, 26(%rdx)
	je	.L1135
.L1136:
	subq	$9, %rsi
	cmpb	$0, (%rsi)
	jne	.L1136
.L1135:
	cmpb	$0, 9(%rsi)
	leaq	9(%rsi), %rax
	movl	$1, %ecx
	je	.L1138
.L1137:
	movzbl	6(%rax), %edx
	testb	%dl, %dl
	je	.L1161
	subb	%dl, (%rax)
.L1161:
	movzbl	(%rax), %edx
	movb	$1, 6(%rax)
	testb	%dl, %dl
	je	.L1142
	movzbl	8(%rax), %esi
	decl	%edx
	movb	$0, 6(%rax)
	movb	%dl, (%rax)
	testb	%sil, %sil
	je	.L2189
	addl	%edx, %esi
	movb	$0, 8(%rax)
	movb	%sil, (%rax)
.L2189:
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L1142
.L1141:
	decl	%edx
	incb	8(%rax)
	cmpb	$0, -9(%rax)
	movb	%dl, (%rax)
	leaq	-9(%rax), %rdx
	je	.L1143
.L1144:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L1144
.L1143:
	cmpb	$0, 9(%rdx)
	movb	$1, 4(%rdx)
	leaq	9(%rdx), %rax
	je	.L1145
.L1146:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L1146
.L1145:
	movzbl	(%rax), %edx
	incb	1(%rax)
	testb	%dl, %dl
	jne	.L1141
.L1142:
	movzbl	8(%rax), %esi
	movl	%ecx, %edx
	movb	$1, 8(%rax)
	subl	%esi, %edx
	testb	%sil, %sil
	cmove	%ecx, %edx
	movb	%dl, (%rax)
	testb	%dl, %dl
	je	.L1151
	movzbl	6(%rax), %esi
	decl	%edx
	movb	$0, 8(%rax)
	movb	%dl, (%rax)
	testb	%sil, %sil
	je	.L2190
	addl	%edx, %esi
	movb	$0, 6(%rax)
	movb	%sil, (%rax)
.L2190:
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L1151
.L1150:
	decl	%edx
	incb	6(%rax)
	cmpb	$0, -9(%rax)
	movb	%dl, (%rax)
	leaq	-9(%rax), %rdx
	je	.L1152
.L1153:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L1153
.L1152:
	cmpb	$0, 9(%rdx)
	movb	$1, 3(%rdx)
	leaq	9(%rdx), %rax
	je	.L1154
.L1155:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L1155
.L1154:
	movzbl	(%rax), %edx
	movb	$1, 1(%rax)
	testb	%dl, %dl
	jne	.L1150
.L1151:
	movb	$1, (%rax)
	leaq	1(%rax), %rdx
	movzbl	1(%rax), %eax
	testb	%al, %al
	je	.L1156
.L1159:
	decl	%eax
	cmpb	$0, -1(%rdx)
	movb	%al, (%rdx)
	leaq	-1(%rdx), %rax
	je	.L1157
.L1158:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L1158
.L1157:
	leaq	-8(%rax), %rdx
	movzbl	-8(%rax), %eax
	testb	%al, %al
	jne	.L1159
.L1156:
	cmpb	$0, 8(%rdx)
	leaq	8(%rdx), %rax
	jne	.L1137
.L1138:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rcx
	je	.L1162
.L1163:
	subq	$9, %rcx
	cmpb	$0, (%rcx)
	jne	.L1163
.L1162:
	cmpb	$0, 4(%rcx)
	je	.L1164
	movb	$0, 4(%rcx)
.L1164:
	movzbl	1(%rcx), %eax
	leaq	1(%rcx), %rdx
	addb	$5, %al
	movb	%al, 1(%rcx)
	je	.L1165
.L1168:
	decb	%al
	movb	%al, (%rdx)
	je	.L1166
	movb	$0, (%rdx)
	addb	%al, 9(%rdx)
	addq	$9, %rdx
	movzbl	(%rdx), %eax
	testb	%al, %al
	jne	.L1168
.L1165:
	decb	5(%rdx)
	leaq	26(%rdx), %rax
	decb	32(%rdx)
	cmpb	$0, 26(%rdx)
	je	.L1112
.L1169:
	subq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L1169
.L1112:
	cmpb	$0, 3(%rax)
	leaq	3(%rax), %rdx
	jne	.L1170
	movq	8(%rsp), %rbp
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L1123:
	.cfi_restore_state
	testb	%cl, %cl
	jne	.L1124
.L1125:
	movb	$0, (%rax)
	movb	$0, 8(%rax)
.L1120:
	movzbl	1(%rax), %edx
	testb	%dl, %dl
	je	.L1127
	addb	%dl, 8(%rax)
	movb	$0, 1(%rax)
.L1127:
	incb	(%rax)
	subq	$9, %rax
	movzbl	(%rax), %edx
	testb	%dl, %dl
	jne	.L1118
	jmp	.L1119
.L902:
	movb	$1, (%rax)
	leaq	1(%rax), %rdx
	movzbl	1(%rax), %eax
	testb	%al, %al
	je	.L907
.L910:
	decl	%eax
	cmpb	$0, -1(%rdx)
	movb	%al, (%rdx)
	leaq	-1(%rdx), %rax
	je	.L908
.L909:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L909
.L908:
	leaq	-8(%rax), %rdx
	movzbl	-8(%rax), %eax
	testb	%al, %al
	jne	.L910
.L907:
	cmpb	$0, 8(%rdx)
	leaq	8(%rdx), %rax
	jne	.L888
.L889:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L913
.L914:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L914
.L913:
	movzbl	4(%rdx), %eax
	decb	2(%rdx)
	testb	%al, %al
	je	.L915
	addb	%al, (%rdx)
	movb	$0, 4(%rdx)
.L915:
	movzbl	(%rdx), %eax
	testb	%al, %al
	je	.L916
	leal	-1(%rax), %esi
	addb	4(%rdx), %al
	movl	%eax, %edi
	subl	%esi, %edi
	cmpb	$0, 2(%rdx)
	je	.L2221
.L917:
	movb	$0, 2(%rdx)
	testb	%sil, %sil
	je	.L919
	decl	%esi
	movl	%eax, %edi
	subl	%esi, %edi
	cmpb	$0, 2(%rdx)
	jne	.L917
.L2221:
	testb	%sil, %sil
	cmovne	%eax, %edi
.L919:
	movb	%dil, 4(%rdx)
	movb	$0, (%rdx)
.L916:
	cmpb	$0, 2(%rdx)
	leaq	2(%rdx), %rbp
	jne	.L921
.L195:
	movzbl	-2(%rbp), %eax
	incl	%eax
	subb	2(%rbp), %al
	movb	$1, 2(%rbp)
	movb	%al, -2(%rbp)
	je	.L923
.L924:
	decl	%eax
	decb	2(%rbp)
	movsbl	-4(%rbp), %edi
	movb	%al, -2(%rbp)
	movq	stdout(%rip), %rsi
	call	putc@PLT
	movzbl	-2(%rbp), %eax
	testb	%al, %al
	jne	.L924
	movzbl	2(%rbp), %eax
	testb	%al, %al
	je	.L2222
.L926:
	decl	%eax
	movsbl	-5(%rbp), %edi
	movq	stdout(%rip), %rsi
	movb	%al, 2(%rbp)
	call	putc@PLT
	movzbl	2(%rbp), %eax
	testb	%al, %al
	jne	.L926
.L2222:
	cmpb	$0, -1(%rbp)
	je	.L927
	movb	$0, -1(%rbp)
.L927:
	cmpb	$0, 0(%rbp)
	je	.L928
	movb	$0, 0(%rbp)
.L928:
	cmpb	$0, 1(%rbp)
	je	.L929
	movb	$0, 1(%rbp)
.L929:
	cmpb	$0, 3(%rbp)
	je	.L930
	movb	$0, 3(%rbp)
.L930:
	cmpb	$0, 4(%rbp)
	je	.L931
	movb	$0, 4(%rbp)
.L931:
	cmpb	$0, 7(%rbp)
	leaq	7(%rbp), %rax
	je	.L933
.L932:
	cmpb	$0, 1(%rax)
	je	.L941
	movb	$0, 1(%rax)
.L941:
	cmpb	$0, 2(%rax)
	je	.L934
	movb	$0, 2(%rax)
.L934:
	cmpb	$0, 3(%rax)
	je	.L935
	movb	$0, 3(%rax)
.L935:
	cmpb	$0, 4(%rax)
	je	.L936
	movb	$0, 4(%rax)
.L936:
	cmpb	$0, 5(%rax)
	je	.L937
	movb	$0, 5(%rax)
.L937:
	cmpb	$0, 6(%rax)
	je	.L938
	movb	$0, 6(%rax)
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L932
.L933:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L942
.L943:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L943
.L942:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L945
.L944:
	cmpb	$0, 5(%rax)
	je	.L2223
	movb	$0, 5(%rax)
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L944
.L945:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rcx
	je	.L949
.L950:
	subq	$9, %rcx
	cmpb	$0, (%rcx)
	jne	.L950
.L949:
	movzbl	1(%rcx), %eax
	leaq	1(%rcx), %rdx
	addb	$11, %al
	movb	%al, 1(%rcx)
	je	.L951
.L954:
	decb	%al
	movb	%al, (%rdx)
	je	.L952
	movb	$0, (%rdx)
	addb	%al, 9(%rdx)
	addq	$9, %rdx
	movzbl	(%rdx), %eax
	testb	%al, %al
	jne	.L954
.L951:
	incb	4(%rdx)
	leaq	-1(%rdx), %rax
	incb	13(%rdx)
	cmpb	$0, -1(%rdx)
	je	.L955
.L956:
	subq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L956
.L955:
	movzbl	7(%rax), %edx
	testb	%dl, %dl
	je	.L957
	addb	%dl, (%rax)
	movb	$0, 7(%rax)
.L957:
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L958
	decl	%edx
	cmpb	$0, 9(%rax)
	movb	$0, 7(%rax)
	movb	%dl, (%rax)
	leaq	9(%rax), %rdx
	je	.L959
.L960:
	addq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L960
.L959:
	cmpb	$0, -9(%rdx)
	leaq	-9(%rdx), %rax
	je	.L962
.L961:
	movzbl	7(%rax), %edx
	testb	%dl, %dl
	je	.L968
	addb	%dl, 1(%rax)
	movb	$0, 7(%rax)
.L968:
	leaq	1(%rax), %rdx
	movzbl	1(%rax), %eax
	testb	%al, %al
	je	.L963
.L966:
	decl	%eax
	incb	6(%rdx)
	cmpb	$0, -1(%rdx)
	movb	%al, (%rdx)
	leaq	-1(%rdx), %rax
	je	.L964
.L965:
	subq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L965
.L964:
	movb	$1, 7(%rax)
	leaq	10(%rax), %rdx
	movzbl	10(%rax), %eax
	testb	%al, %al
	jne	.L966
.L963:
	cmpb	$0, -10(%rdx)
	leaq	-10(%rdx), %rax
	jne	.L961
.L962:
	movzbl	7(%rax), %edx
	testb	%dl, %dl
	je	.L2185
.L1179:
	addb	%dl, (%rax)
	movb	$0, 7(%rax)
.L2185:
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L970
	decl	%edx
	incb	7(%rax)
	cmpb	$0, 9(%rax)
	movb	%dl, (%rax)
	leaq	9(%rax), %rdx
	je	.L971
.L975:
	movzbl	1(%rdx), %eax
	movzbl	5(%rdx), %ecx
	incl	%eax
	movb	%al, 1(%rdx)
	testb	%cl, %cl
	je	.L972
	subl	%ecx, %eax
	movb	$0, 5(%rdx)
	movb	%al, 1(%rdx)
.L972:
	movzbl	1(%rdx), %eax
	testb	%al, %al
	je	.L973
	addb	%al, 5(%rdx)
	addq	$9, %rdx
	movb	$0, -8(%rdx)
	cmpb	$0, (%rdx)
	jne	.L975
.L971:
	incb	-2(%rdx)
	cmpb	$0, -9(%rdx)
	leaq	-9(%rdx), %rax
	je	.L977
.L976:
	movzbl	5(%rax), %edx
	testb	%dl, %dl
	je	.L2224
	addb	%dl, 7(%rax)
	subq	$9, %rax
	movb	$0, 14(%rax)
	cmpb	$0, (%rax)
	jne	.L976
.L977:
	cmpb	$0, 9(%rax)
	leaq	9(%rax), %rdx
	je	.L981
.L982:
	addq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L982
.L981:
	leaq	-9(%rdx), %rax
	movzbl	-9(%rdx), %edx
	testb	%dl, %dl
	je	.L984
.L983:
	cmpb	$0, 1(%rax)
	je	.L995
	movb	$0, 1(%rax)
.L995:
	movzbl	7(%rax), %ecx
	decl	%edx
	movb	%dl, (%rax)
	testb	%cl, %cl
	je	.L985
.L991:
	movzbl	1(%rax), %esi
	decl	%ecx
	incl	%edx
	testb	%sil, %sil
	je	.L987
	addb	%sil, -2(%rax)
	movb	$0, 1(%rax)
	subb	%sil, %dl
	je	.L988
.L987:
	addb	%dl, 1(%rax)
	testb	%cl, %cl
	je	.L990
.L989:
	xorl	%edx, %edx
	jmp	.L991
.L923:
	movl	$1, %eax
	jmp	.L926
.L938:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L932
	jmp	.L933
.L199:
	movzbl	1(%rax), %edx
	incq	%rax
	testb	%dl, %dl
	jne	.L201
	jmp	.L198
.L205:
	addq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L202
	jmp	.L203
.L214:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L212
	jmp	.L213
.L2223:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L944
	jmp	.L945
.L2218:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L220
	jmp	.L221
.L952:
	movzbl	9(%rdx), %eax
	addq	$9, %rdx
	testb	%al, %al
	jne	.L954
	jmp	.L951
.L1132:
	movzbl	9(%rdx), %ecx
	addq	$9, %rdx
	testb	%cl, %cl
	jne	.L1134
	jmp	.L1131
.L958:
	movzbl	7(%rax), %edx
	testb	%dl, %dl
	jne	.L1179
.L970:
	movzbl	7(%rax), %esi
	movl	$1, %ecx
	movb	$1, 7(%rax)
	movl	%ecx, %edx
	subl	%esi, %edx
	testb	%sil, %sil
	cmove	%ecx, %edx
	movb	%dl, (%rax)
	testb	%dl, %dl
	je	.L998
	decl	%edx
	cmpb	$0, 9(%rax)
	movb	$0, 7(%rax)
	movb	%dl, (%rax)
	leaq	9(%rax), %rdx
	je	.L1000
.L999:
	movzbl	5(%rdx), %eax
	testb	%al, %al
	je	.L2225
	addb	%al, 7(%rdx)
	addq	$9, %rdx
	movb	$0, -4(%rdx)
	cmpb	$0, (%rdx)
	jne	.L999
.L1000:
	leaq	-9(%rdx), %rax
	movzbl	-9(%rdx), %edx
	testb	%dl, %dl
	je	.L1005
.L1004:
	cmpb	$0, 1(%rax)
	je	.L1016
	movb	$0, 1(%rax)
.L1016:
	movzbl	7(%rax), %ecx
	decl	%edx
	movb	%dl, (%rax)
	testb	%cl, %cl
	je	.L1006
.L1012:
	movzbl	1(%rax), %esi
	decl	%ecx
	incl	%edx
	testb	%sil, %sil
	je	.L1008
	addb	%sil, -2(%rax)
	movb	$0, 1(%rax)
	subb	%sil, %dl
	je	.L1009
.L1008:
	addb	%dl, 1(%rax)
	testb	%cl, %cl
	je	.L1011
.L1010:
	xorl	%edx, %edx
	jmp	.L1012
.L246:
	.cfi_offset 3, -32
	leaq	1(%rax), %rdx
	jmp	.L252
.L269:
	.cfi_restore 3
	testb	%sil, %sil
	jne	.L270
.L271:
	movb	$0, (%rdx)
	movb	$0, 3(%rdx)
.L266:
	movzbl	1(%rdx), %eax
	testb	%al, %al
	je	.L273
	addb	%al, 3(%rdx)
	movb	$0, 1(%rdx)
.L273:
	incb	(%rdx)
	subq	$9, %rdx
	movzbl	(%rdx), %eax
	testb	%al, %al
	jne	.L264
.L265:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L278
.L277:
	movzbl	6(%rax), %edx
	testb	%dl, %dl
	je	.L282
	addb	%dl, 1(%rax)
	movb	$0, 6(%rax)
.L282:
	movzbl	1(%rax), %edx
	testb	%dl, %dl
	je	.L279
	addb	%dl, 6(%rax)
	addb	%dl, 2(%rax)
	addq	$9, %rax
	movb	$0, -8(%rax)
	cmpb	$0, (%rax)
	jne	.L277
.L278:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L283
.L284:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L284
.L283:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L285
.L286:
	incb	1(%rax)
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L286
.L285:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L287
.L288:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L288
.L287:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L289
	movq	%rbx, (%rsp)
	.cfi_offset 3, -32
.L308:
	movzbl	1(%rax), %ebx
	movzbl	6(%rax), %edx
	leal	-1(%rbx), %esi
	movb	%sil, 1(%rax)
	testb	%dl, %dl
	je	.L290
	addl	%esi, %edx
	movb	$0, 6(%rax)
	movb	%dl, 1(%rax)
.L290:
	movzbl	1(%rax), %edx
	testb	%dl, %dl
	je	.L291
	decl	%edx
	incb	6(%rax)
	movb	%dl, 1(%rax)
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L292
.L296:
	movzbl	2(%rax), %esi
	decl	%edx
	movb	%dl, (%rax)
	testb	%sil, %sil
	je	.L293
	addl	%edx, %esi
	movb	$0, 2(%rax)
	movb	%sil, (%rax)
.L293:
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L294
	addb	%dl, 2(%rax)
	addb	%dl, 4(%rax)
.L294:
	movb	$1, (%rax)
	addq	$9, %rax
	movzbl	(%rax), %edx
	testb	%dl, %dl
	jne	.L296
.L292:
	cmpb	$0, -8(%rax)
	leaq	-8(%rax), %rdx
	je	.L297
.L298:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L298
.L297:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L299
.L300:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L300
.L299:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L302
.L301:
	movzbl	1(%rdx), %eax
	testb	%al, %al
	je	.L2226
	addb	%al, 10(%rdx)
	subq	$9, %rdx
	movb	$0, 10(%rdx)
	cmpb	$0, (%rdx)
	jne	.L301
.L302:
	movzbl	1(%rdx), %eax
	testb	%al, %al
	je	.L306
.L2232:
	addb	%al, 10(%rdx)
	movl	$1, %edi
	leaq	8(%rdx), %rax
	cmpb	$0, 8(%rdx)
	movw	%di, (%rdx)
	jne	.L308
	movq	(%rsp), %rbx
	.cfi_restore 3
.L289:
	leaq	-9(%rax), %rdx
	movzbl	-9(%rax), %eax
	testb	%al, %al
	je	.L310
.L309:
	cmpb	$0, 1(%rdx)
	je	.L321
	movb	$0, 1(%rdx)
.L321:
	movzbl	4(%rdx), %esi
	decl	%eax
	movb	%al, (%rdx)
	testb	%sil, %sil
	je	.L311
.L317:
	movzbl	1(%rdx), %edi
	decl	%esi
	incl	%eax
	testb	%dil, %dil
	je	.L313
	addb	%dil, -5(%rdx)
	movb	$0, 1(%rdx)
	subb	%dil, %al
	je	.L314
.L313:
	addb	%al, 1(%rdx)
	testb	%sil, %sil
	je	.L316
.L315:
	xorl	%eax, %eax
	jmp	.L317
.L279:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L277
	jmp	.L278
.L2219:
	.cfi_offset 3, -32
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L256
	movzbl	1(%rdx), %eax
	testb	%al, %al
	jne	.L2227
.L261:
	cmpb	$0, 8(%rdx)
	movb	$1, (%rdx)
	leaq	8(%rdx), %rax
	jne	.L263
	movq	(%rsp), %rbx
	.cfi_remember_state
	.cfi_restore 3
	jmp	.L244
.L291:
	.cfi_restore_state
	leaq	1(%rax), %rdx
	jmp	.L297
.L314:
	.cfi_restore 3
	testb	%sil, %sil
	jne	.L315
.L316:
	movb	$0, (%rdx)
	movb	$0, 4(%rdx)
.L311:
	movzbl	1(%rdx), %eax
	testb	%al, %al
	je	.L318
	addb	%al, 4(%rdx)
	movb	$0, 1(%rdx)
.L318:
	incb	(%rdx)
	subq	$9, %rdx
	movzbl	(%rdx), %eax
	testb	%al, %al
	jne	.L309
.L310:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L323
.L322:
	movzbl	4(%rax), %edx
	testb	%dl, %dl
	je	.L2228
	addb	%dl, -32(%rax)
	addq	$9, %rax
	movb	$0, -5(%rax)
	cmpb	$0, (%rax)
	jne	.L322
.L323:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L327
.L328:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L328
.L327:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L330
.L329:
	movzbl	3(%rax), %edx
	testb	%dl, %dl
	je	.L2229
	addb	%dl, -33(%rax)
	addq	$9, %rax
	movb	$0, -6(%rax)
	cmpb	$0, (%rax)
	jne	.L329
.L330:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L334
.L335:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L335
.L334:
	addb	$15, 9(%rdx)
	leaq	9(%rdx), %rax
	jne	.L2161
	jmp	.L337
.L338:
	addq	$9, %rax
.L2161:
	cmpb	$0, (%rax)
	jne	.L338
	decb	-9(%rax)
	cmpb	$0, -18(%rax)
	leaq	-18(%rax), %rdx
	je	.L339
.L340:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L340
.L339:
	decb	9(%rdx)
	leaq	9(%rdx), %rax
	jne	.L2161
.L337:
	movb	$1, (%rax)
	jmp	.L342
.L2230:
	addb	%dl, 8(%rax)
	leaq	9(%rax), %rsi
	addb	%dl, 2(%rax)
	cmpb	$0, 9(%rax)
	movb	$0, 1(%rax)
	je	.L345
.L344:
	movq	%rsi, %rax
.L342:
	movzbl	8(%rax), %edx
	testb	%dl, %dl
	je	.L347
	addb	%dl, 1(%rax)
	movb	$0, 8(%rax)
.L347:
	movzbl	1(%rax), %edx
	testb	%dl, %dl
	jne	.L2230
	cmpb	$0, 9(%rax)
	leaq	9(%rax), %rsi
	jne	.L344
.L345:
	cmpb	$0, -9(%rsi)
	je	.L348
.L349:
	subq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L349
	leaq	9(%rax), %rsi
.L348:
	cmpb	$0, 9(%rax)
	je	.L351
.L350:
	cmpb	$0, 6(%rsi)
	je	.L2231
	movb	$0, 6(%rsi)
	addq	$9, %rsi
	cmpb	$0, (%rsi)
	jne	.L350
.L351:
	cmpb	$0, -9(%rsi)
	leaq	-9(%rsi), %rdx
	je	.L355
.L356:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L356
.L355:
	movzbl	4(%rdx), %eax
	leal	1(%rax), %esi
	movzbl	5(%rdx), %eax
	movb	%sil, 4(%rdx)
	testb	%al, %al
	je	.L357
	subl	%eax, %esi
	addb	%al, (%rdx)
	movb	%sil, 4(%rdx)
	movzbl	6(%rdx), %esi
	movb	$0, 5(%rdx)
	testb	%sil, %sil
	je	.L358
	xorl	%eax, %eax
.L1176:
	movzbl	(%rdx), %r8d
	movzbl	4(%rdx), %edi
	decl	%esi
	testb	%r8b, %r8b
	je	.L359
.L362:
	movb	$0, (%rdx)
	leal	(%rdi,%r8,2), %edi
	addl	%r8d, %eax
.L359:
	testb	%al, %al
	je	.L360
	addb	%al, (%rdx)
.L360:
	decl	%edi
	testb	%sil, %sil
	je	.L361
	movzbl	(%rdx), %r8d
	decl	%esi
	movl	$1, %eax
	testb	%r8b, %r8b
	jne	.L362
	addb	%al, (%rdx)
	jmp	.L360
.L2228:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L322
	jmp	.L323
.L2226:
	.cfi_offset 3, -32
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L301
	movzbl	1(%rdx), %eax
	testb	%al, %al
	jne	.L2232
.L306:
	cmpb	$0, 8(%rdx)
	movb	$1, (%rdx)
	leaq	8(%rdx), %rax
	jne	.L308
	movq	(%rsp), %rbx
	.cfi_restore 3
	jmp	.L289
.L2229:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L329
	jmp	.L330
.L973:
	addq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L975
	jmp	.L971
.L2225:
	addq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L999
	leaq	-9(%rdx), %rax
	movzbl	-9(%rdx), %edx
	testb	%dl, %dl
	jne	.L1004
.L1005:
	movzbl	1(%rax), %ecx
	leaq	1(%rax), %rdx
	addb	$5, %cl
	movb	%cl, 1(%rax)
	je	.L1017
.L1020:
	decb	%cl
	movb	%cl, (%rdx)
	je	.L1018
	movb	$0, (%rdx)
	addb	%cl, 9(%rdx)
	addq	$9, %rdx
	movzbl	(%rdx), %ecx
	testb	%cl, %cl
	jne	.L1020
.L1017:
	incb	4(%rdx)
	cmpb	$0, -1(%rdx)
	leaq	-1(%rdx), %rsi
	je	.L1021
.L1022:
	subq	$9, %rsi
	cmpb	$0, (%rsi)
	jne	.L1022
.L1021:
	cmpb	$0, 9(%rsi)
	leaq	9(%rsi), %rax
	movl	$1, %ecx
	je	.L1024
.L1023:
	movzbl	5(%rax), %edx
	testb	%dl, %dl
	je	.L1047
	subb	%dl, (%rax)
.L1047:
	movzbl	(%rax), %edx
	movb	$1, 5(%rax)
	testb	%dl, %dl
	je	.L1028
	movzbl	7(%rax), %esi
	decl	%edx
	movb	$0, 5(%rax)
	movb	%dl, (%rax)
	testb	%sil, %sil
	je	.L2186
	addl	%edx, %esi
	movb	$0, 7(%rax)
	movb	%sil, (%rax)
.L2186:
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L1028
.L1027:
	decl	%edx
	incb	7(%rax)
	cmpb	$0, -9(%rax)
	movb	%dl, (%rax)
	leaq	-9(%rax), %rdx
	je	.L1029
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L1030:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L1030
.L1029:
	cmpb	$0, 9(%rdx)
	movb	$1, 4(%rdx)
	leaq	9(%rdx), %rax
	je	.L1031
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L1032:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L1032
.L1031:
	movzbl	(%rax), %edx
	incb	1(%rax)
	testb	%dl, %dl
	jne	.L1027
.L1028:
	movzbl	7(%rax), %esi
	movl	%ecx, %edx
	movb	$1, 7(%rax)
	subl	%esi, %edx
	testb	%sil, %sil
	cmove	%ecx, %edx
	movb	%dl, (%rax)
	testb	%dl, %dl
	je	.L1037
	movzbl	5(%rax), %esi
	decl	%edx
	movb	$0, 7(%rax)
	movb	%dl, (%rax)
	testb	%sil, %sil
	je	.L2187
	addl	%edx, %esi
	movb	$0, 5(%rax)
	movb	%sil, (%rax)
.L2187:
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L1037
.L1036:
	decl	%edx
	incb	5(%rax)
	cmpb	$0, -9(%rax)
	movb	%dl, (%rax)
	leaq	-9(%rax), %rdx
	je	.L1038
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L1039:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L1039
.L1038:
	cmpb	$0, 9(%rdx)
	movb	$1, 3(%rdx)
	leaq	9(%rdx), %rax
	je	.L1040
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L1041:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L1041
.L1040:
	movzbl	(%rax), %edx
	movb	$1, 1(%rax)
	testb	%dl, %dl
	jne	.L1036
.L1037:
	movb	$1, (%rax)
	leaq	1(%rax), %rdx
	movzbl	1(%rax), %eax
	testb	%al, %al
	je	.L1042
.L1045:
	decl	%eax
	cmpb	$0, -1(%rdx)
	movb	%al, (%rdx)
	leaq	-1(%rdx), %rax
	je	.L1043
.L1044:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L1044
.L1043:
	leaq	-8(%rax), %rdx
	movzbl	-8(%rax), %eax
	testb	%al, %al
	jne	.L1045
.L1042:
	cmpb	$0, 8(%rdx)
	leaq	8(%rdx), %rax
	jne	.L1023
.L1024:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rcx
	je	.L1048
.L1049:
	subq	$9, %rcx
	cmpb	$0, (%rcx)
	jne	.L1049
.L1048:
	cmpb	$0, 4(%rcx)
	je	.L1050
	movb	$0, 4(%rcx)
.L1050:
	movzbl	1(%rcx), %eax
	leaq	1(%rcx), %rdx
	addb	$5, %al
	movb	%al, 1(%rcx)
	je	.L1051
.L1054:
	decb	%al
	movb	%al, (%rdx)
	je	.L1052
	movb	$0, (%rdx)
	addb	%al, 9(%rdx)
	addq	$9, %rdx
	movzbl	(%rdx), %eax
	testb	%al, %al
	jne	.L1054
.L1051:
	decb	4(%rdx)
	cmpb	$0, -1(%rdx)
	leaq	-1(%rdx), %rax
	je	.L998
.L1055:
	subq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L1055
	jmp	.L998
.L1009:
	testb	%cl, %cl
	jne	.L1010
.L1011:
	movb	$0, (%rax)
	movb	$0, 7(%rax)
.L1006:
	movzbl	1(%rax), %edx
	testb	%dl, %dl
	je	.L1013
	addb	%dl, 7(%rax)
	movb	$0, 1(%rax)
.L1013:
	incb	(%rax)
	subq	$9, %rax
	movzbl	(%rax), %edx
	testb	%dl, %dl
	jne	.L1004
	jmp	.L1005
.L2224:
	subq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L976
	jmp	.L977
.L988:
	testb	%cl, %cl
	jne	.L989
.L990:
	movb	$0, (%rax)
	movb	$0, 7(%rax)
.L985:
	movzbl	1(%rax), %edx
	testb	%dl, %dl
	je	.L992
	addb	%dl, 7(%rax)
	movb	$0, 1(%rax)
.L992:
	incb	(%rax)
	subq	$9, %rax
	movzbl	(%rax), %edx
	testb	%dl, %dl
	jne	.L983
.L984:
	decb	7(%rax)
	movb	$1, 3(%rax)
	jmp	.L2185
.L1166:
	movzbl	9(%rdx), %eax
	addq	$9, %rdx
	testb	%al, %al
	jne	.L1168
	jmp	.L1165
.L1018:
	movzbl	9(%rdx), %ecx
	addq	$9, %rdx
	testb	%cl, %cl
	jne	.L1020
	jmp	.L1017
.L1052:
	movzbl	9(%rdx), %eax
	addq	$9, %rdx
	testb	%al, %al
	jne	.L1054
	jmp	.L1051
.L2231:
	addq	$9, %rsi
	cmpb	$0, (%rsi)
	jne	.L350
	jmp	.L351
.L361:
	movb	%dil, 4(%rdx)
	movb	$0, 5(%rdx)
	movb	$1, 6(%rdx)
.L358:
	movzbl	(%rdx), %eax
	testb	%al, %al
	je	.L364
.L1185:
	addb	%al, 5(%rdx)
.L364:
	cmpb	$0, 6(%rdx)
	je	.L365
	movb	$0, 6(%rdx)
.L365:
	movzbl	4(%rdx), %esi
	movl	%ecx, %eax
	movb	$1, 4(%rdx)
	subl	%esi, %eax
	testb	%sil, %sil
	cmove	%ecx, %eax
	movb	%al, (%rdx)
	testb	%al, %al
	je	.L367
	decl	%eax
	cmpb	$0, 9(%rdx)
	movb	$0, 4(%rdx)
	movb	%al, (%rdx)
	leaq	9(%rdx), %rax
	je	.L369
.L368:
	movzbl	2(%rax), %edx
	testb	%dl, %dl
	je	.L392
	subb	%dl, (%rax)
.L392:
	movzbl	(%rax), %edx
	movb	$1, 2(%rax)
	testb	%dl, %dl
	je	.L373
	movzbl	3(%rax), %esi
	decl	%edx
	movb	$0, 2(%rax)
	movb	%dl, (%rax)
	testb	%sil, %sil
	je	.L2162
	addl	%edx, %esi
	movb	$0, 3(%rax)
	movb	%sil, (%rax)
.L2162:
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L373
	.p2align 4,,10
	.p2align 3
.L372:
	decl	%edx
	incb	3(%rax)
	cmpb	$0, -9(%rax)
	movb	%dl, (%rax)
	leaq	-9(%rax), %rdx
	je	.L374
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L375:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L375
.L374:
	cmpb	$0, 9(%rdx)
	movb	$1, 3(%rdx)
	leaq	9(%rdx), %rax
	je	.L376
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L377:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L377
.L376:
	movzbl	(%rax), %edx
	incb	1(%rax)
	testb	%dl, %dl
	jne	.L372
.L373:
	movzbl	3(%rax), %esi
	movl	%ecx, %edx
	movb	$1, 3(%rax)
	subl	%esi, %edx
	testb	%sil, %sil
	cmove	%ecx, %edx
	movb	%dl, (%rax)
	testb	%dl, %dl
	je	.L382
	movzbl	2(%rax), %esi
	decl	%edx
	movb	$0, 3(%rax)
	movb	%dl, (%rax)
	testb	%sil, %sil
	je	.L2163
	addl	%edx, %esi
	movb	$0, 2(%rax)
	movb	%sil, (%rax)
.L2163:
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L382
	.p2align 4,,10
	.p2align 3
.L381:
	decl	%edx
	incb	2(%rax)
	cmpb	$0, -9(%rax)
	movb	%dl, (%rax)
	leaq	-9(%rax), %rdx
	je	.L383
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L384:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L384
.L383:
	cmpb	$0, 9(%rdx)
	movb	$1, 4(%rdx)
	leaq	9(%rdx), %rax
	je	.L385
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L386:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L386
.L385:
	movzbl	(%rax), %edx
	movb	$1, 1(%rax)
	testb	%dl, %dl
	jne	.L381
.L382:
	movb	$1, (%rax)
	leaq	1(%rax), %rdx
	movzbl	1(%rax), %eax
	testb	%al, %al
	je	.L387
.L390:
	decl	%eax
	cmpb	$0, -1(%rdx)
	movb	%al, (%rdx)
	leaq	-1(%rdx), %rax
	je	.L388
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L389:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L389
.L388:
	leaq	-8(%rax), %rdx
	movzbl	-8(%rax), %eax
	testb	%al, %al
	jne	.L390
.L387:
	cmpb	$0, 8(%rdx)
	leaq	8(%rdx), %rax
	jne	.L368
.L369:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L393
.L394:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L394
.L393:
	movzbl	4(%rdx), %eax
	testb	%al, %al
	je	.L395
	addb	%al, (%rdx)
	movb	$0, 4(%rdx)
.L395:
	movzbl	(%rdx), %eax
	testb	%al, %al
	je	.L396
	movq	%rbx, (%rsp)
	.cfi_offset 3, -32
.L420:
	decl	%eax
	incb	4(%rdx)
	cmpb	$0, 9(%rdx)
	movb	%al, (%rdx)
	leaq	9(%rdx), %rax
	je	.L397
.L401:
	movzbl	1(%rax), %ebx
	movzbl	3(%rax), %esi
	leal	1(%rbx), %edx
	movb	%dl, 1(%rax)
	testb	%sil, %sil
	je	.L398
	subl	%esi, %edx
	movb	$0, 3(%rax)
	movb	%dl, 1(%rax)
.L398:
	movzbl	1(%rax), %edx
	testb	%dl, %dl
	je	.L399
	addb	%dl, 3(%rax)
	addq	$9, %rax
	movb	$0, -8(%rax)
	cmpb	$0, (%rax)
	jne	.L401
.L397:
	incb	-8(%rax)
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L403
.L402:
	movzbl	1(%rdx), %r10d
	testb	%r10b, %r10b
	je	.L2233
	movzbl	6(%rdx), %eax
	movzbl	2(%rdx), %r8d
	movzbl	3(%rdx), %esi
	.p2align 4,,10
	.p2align 3
.L410:
	decl	%r10d
	incl	%eax
	testb	%r8b, %r8b
	je	.L404
	leal	-1(%r8), %edi
	addb	-8(%rdx), %r8b
	decl	%eax
	movl	%r8d, %r9d
	subl	%edi, %r9d
	testb	%sil, %sil
	je	.L2234
.L405:
	movb	$0, 3(%rdx)
	addl	%esi, %eax
	testb	%dil, %dil
	je	.L2235
	decl	%edi
	movl	%r8d, %r9d
	xorl	%esi, %esi
	decl	%eax
	subl	%edi, %r9d
	testb	%sil, %sil
	jne	.L405
.L2234:
	testb	%dil, %dil
	je	.L407
	movl	%r8d, %r9d
	subl	%edi, %eax
.L407:
	movb	$0, 2(%rdx)
	xorl	%r8d, %r8d
	movb	%r9b, -8(%rdx)
.L404:
	testb	%sil, %sil
	je	.L409
	movzbl	-8(%rdx), %edi
	movb	$0, 3(%rdx)
	subl	%esi, %eax
	addl	%esi, %edi
	xorl	%esi, %esi
	movb	%dil, -8(%rdx)
.L409:
	testb	%r10b, %r10b
	jne	.L410
	movb	$0, 1(%rdx)
	movb	%al, 6(%rdx)
.L419:
	testb	%r8b, %r8b
	je	.L411
	movzbl	6(%rdx), %eax
	decl	%r8d
	incl	%eax
	testb	%sil, %sil
	je	.L2236
.L412:
	addb	%sil, -8(%rdx)
	subl	%esi, %eax
	movb	$0, 3(%rdx)
	testb	%r8b, %r8b
	je	.L2237
	xorl	%esi, %esi
	decl	%r8d
	incl	%eax
	testb	%sil, %sil
	jne	.L412
.L2236:
	addl	%r8d, %eax
.L414:
	movb	$0, 2(%rdx)
	movb	%al, 6(%rdx)
.L411:
	testb	%sil, %sil
	je	.L416
	addb	%sil, 6(%rdx)
	subq	$9, %rdx
	movb	$0, 12(%rdx)
	cmpb	$0, (%rdx)
	jne	.L402
.L403:
	cmpb	$0, 4(%rdx)
	je	.L2164
	movzbl	(%rdx), %eax
	movb	$0, 4(%rdx)
	testb	%al, %al
	jne	.L420
.L2164:
	movq	(%rsp), %rbx
	.cfi_restore 3
.L396:
	movzbl	3(%rdx), %eax
	testb	%al, %al
	je	.L421
	addb	%al, (%rdx)
	movb	$0, 3(%rdx)
.L421:
	movzbl	(%rdx), %eax
	testb	%al, %al
	je	.L422
	movq	%rbx, (%rsp)
	.cfi_offset 3, -32
.L446:
	decl	%eax
	incb	3(%rdx)
	cmpb	$0, 9(%rdx)
	movb	%al, (%rdx)
	leaq	9(%rdx), %rax
	je	.L423
.L427:
	movzbl	1(%rax), %ebx
	movzbl	2(%rax), %esi
	leal	1(%rbx), %edx
	movb	%dl, 1(%rax)
	testb	%sil, %sil
	je	.L424
	subl	%esi, %edx
	movb	$0, 2(%rax)
	movb	%dl, 1(%rax)
.L424:
	movzbl	1(%rax), %edx
	testb	%dl, %dl
	je	.L425
	addb	%dl, 2(%rax)
	addq	$9, %rax
	movb	$0, -8(%rax)
	cmpb	$0, (%rax)
	jne	.L427
.L423:
	incb	-8(%rax)
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L429
.L428:
	movzbl	1(%rdx), %r10d
	testb	%r10b, %r10b
	je	.L2238
	movzbl	6(%rdx), %eax
	movzbl	3(%rdx), %r8d
	movzbl	2(%rdx), %esi
	.p2align 4,,10
	.p2align 3
.L436:
	decl	%r10d
	incl	%eax
	testb	%r8b, %r8b
	je	.L430
	leal	-1(%r8), %edi
	addb	-8(%rdx), %r8b
	decl	%eax
	movl	%r8d, %r9d
	subl	%edi, %r9d
	testb	%sil, %sil
	je	.L2239
.L431:
	movb	$0, 2(%rdx)
	addl	%esi, %eax
	testb	%dil, %dil
	je	.L2240
	decl	%edi
	movl	%r8d, %r9d
	xorl	%esi, %esi
	decl	%eax
	subl	%edi, %r9d
	testb	%sil, %sil
	jne	.L431
.L2239:
	testb	%dil, %dil
	je	.L433
	movl	%r8d, %r9d
	subl	%edi, %eax
.L433:
	movb	$0, 3(%rdx)
	xorl	%r8d, %r8d
	movb	%r9b, -8(%rdx)
.L430:
	testb	%sil, %sil
	je	.L435
	movzbl	-8(%rdx), %edi
	movb	$0, 2(%rdx)
	subl	%esi, %eax
	addl	%esi, %edi
	xorl	%esi, %esi
	movb	%dil, -8(%rdx)
.L435:
	testb	%r10b, %r10b
	jne	.L436
	movb	$0, 1(%rdx)
	movb	%al, 6(%rdx)
.L445:
	testb	%r8b, %r8b
	je	.L437
	movzbl	6(%rdx), %eax
	decl	%r8d
	incl	%eax
	testb	%sil, %sil
	je	.L2241
.L438:
	addb	%sil, -8(%rdx)
	subl	%esi, %eax
	movb	$0, 2(%rdx)
	testb	%r8b, %r8b
	je	.L2242
	xorl	%esi, %esi
	decl	%r8d
	incl	%eax
	testb	%sil, %sil
	jne	.L438
.L2241:
	addl	%r8d, %eax
.L440:
	movb	$0, 3(%rdx)
	movb	%al, 6(%rdx)
.L437:
	testb	%sil, %sil
	je	.L442
	addb	%sil, 6(%rdx)
	subq	$9, %rdx
	movb	$0, 11(%rdx)
	cmpb	$0, (%rdx)
	jne	.L428
.L429:
	movzbl	(%rdx), %eax
	incb	6(%rdx)
	testb	%al, %al
	jne	.L446
.L2249:
	movq	(%rsp), %rbx
	.cfi_restore 3
.L422:
	movzbl	4(%rdx), %eax
	testb	%al, %al
	jne	.L1184
.L447:
	cmpb	$0, 1(%rdx)
	je	.L467
	movb	$0, 1(%rdx)
.L467:
	cmpb	$0, 3(%rdx)
	je	.L468
	movb	$0, 3(%rdx)
.L468:
	cmpb	$0, 4(%rdx)
	je	.L469
	movb	$0, 4(%rdx)
.L469:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L471
.L470:
	cmpb	$0, 2(%rax)
	je	.L475
	movb	$0, 2(%rax)
.L475:
	cmpb	$0, 3(%rax)
	je	.L472
	movb	$0, 3(%rax)
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L470
.L471:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L476
.L477:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L477
.L476:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L479
.L478:
	movzbl	5(%rax), %edx
	testb	%dl, %dl
	je	.L483
	addb	%dl, 1(%rax)
	movb	$0, 5(%rax)
.L483:
	movzbl	1(%rax), %edx
	testb	%dl, %dl
	je	.L480
	addb	%dl, 5(%rax)
	addb	%dl, 2(%rax)
	addq	$9, %rax
	movb	$0, -8(%rax)
	cmpb	$0, (%rax)
	jne	.L478
.L479:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L484
.L485:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L485
.L484:
	addb	$15, 9(%rdx)
	leaq	9(%rdx), %rax
	jne	.L2166
	jmp	.L487
.L488:
	addq	$9, %rax
.L2166:
	cmpb	$0, (%rax)
	jne	.L488
	cmpb	$0, 1(%rax)
	movb	$1, (%rax)
	je	.L489
	movb	$0, 1(%rax)
.L489:
	cmpb	$0, 2(%rax)
	je	.L490
	movb	$0, 2(%rax)
.L490:
	cmpb	$0, 3(%rax)
	je	.L491
	movb	$0, 3(%rax)
.L491:
	cmpb	$0, 4(%rax)
	je	.L492
	movb	$0, 4(%rax)
.L492:
	cmpb	$0, 5(%rax)
	je	.L493
	movb	$0, 5(%rax)
.L493:
	cmpb	$0, 6(%rax)
	je	.L494
	movb	$0, 6(%rax)
.L494:
	cmpb	$0, 7(%rax)
	je	.L495
	movb	$0, 7(%rax)
.L495:
	cmpb	$0, 8(%rax)
	je	.L496
	movb	$0, 8(%rax)
.L496:
	cmpb	$0, 9(%rax)
	je	.L497
	movb	$0, 9(%rax)
.L497:
	movq	%rax, %rdx
.L498:
	movq	%rdx, %rax
	leaq	-9(%rdx), %rdx
	cmpb	$0, -9(%rax)
	jne	.L498
	decb	9(%rdx)
	jne	.L2166
.L487:
	movb	$1, (%rax)
.L500:
	incb	1(%rax)
	movq	%rax, %rdx
	leaq	9(%rax), %rax
	cmpb	$0, 9(%rdx)
	jne	.L500
	cmpb	$0, -9(%rax)
	je	.L501
.L502:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L502
.L501:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L503
	movq	%rbx, (%rsp)
	.cfi_offset 3, -32
.L522:
	movzbl	1(%rax), %ebx
	movzbl	5(%rax), %edx
	leal	-1(%rbx), %esi
	movb	%sil, 1(%rax)
	testb	%dl, %dl
	je	.L504
	addl	%esi, %edx
	movb	$0, 5(%rax)
	movb	%dl, 1(%rax)
.L504:
	movzbl	1(%rax), %edx
	testb	%dl, %dl
	je	.L505
	decl	%edx
	incb	5(%rax)
	movb	%dl, 1(%rax)
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L506
.L510:
	movzbl	2(%rax), %esi
	decl	%edx
	movb	%dl, (%rax)
	testb	%sil, %sil
	je	.L507
	addl	%edx, %esi
	movb	$0, 2(%rax)
	movb	%sil, (%rax)
.L507:
	movzbl	(%rax), %edi
	testb	%dil, %dil
	je	.L508
	movzbl	%dil, %r11d
	movzbl	2(%rax), %esi
	movl	%edi, %edx
	movl	%r11d, %ebx
	movb	3(%rax), %bh
	movl	%ebx, %r11d
	movl	%esi, %ebx
	movb	%dl, %bh
	movl	%r11d, %edx
	addb	%bl, %dl
	addb	%bh, %dh
	movw	%dx, 2(%rax)
.L508:
	movb	$1, (%rax)
	addq	$9, %rax
	movzbl	(%rax), %edx
	testb	%dl, %dl
	jne	.L510
.L506:
	cmpb	$0, -8(%rax)
	leaq	-8(%rax), %rdx
	je	.L511
.L512:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L512
.L511:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L513
.L514:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L514
.L513:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L516
.L515:
	movzbl	1(%rdx), %eax
	testb	%al, %al
	je	.L2243
	addb	%al, 10(%rdx)
	subq	$9, %rdx
	movb	$0, 10(%rdx)
	cmpb	$0, (%rdx)
	jne	.L515
.L516:
	movzbl	1(%rdx), %eax
	testb	%al, %al
	je	.L520
.L2256:
	addb	%al, 10(%rdx)
	movl	$1, %esi
	leaq	8(%rdx), %rax
	cmpb	$0, 8(%rdx)
	movw	%si, (%rdx)
	jne	.L522
	movq	(%rsp), %rbx
	.cfi_restore 3
.L503:
	leaq	-9(%rax), %rdx
	movzbl	-9(%rax), %eax
	testb	%al, %al
	je	.L524
.L523:
	cmpb	$0, 1(%rdx)
	je	.L535
	movb	$0, 1(%rdx)
.L535:
	movzbl	3(%rdx), %esi
	decl	%eax
	movb	%al, (%rdx)
	testb	%sil, %sil
	je	.L525
.L531:
	movzbl	1(%rdx), %edi
	decl	%esi
	incl	%eax
	testb	%dil, %dil
	je	.L527
	addb	%dil, -6(%rdx)
	movb	$0, 1(%rdx)
	subb	%dil, %al
	je	.L528
.L527:
	addb	%al, 1(%rdx)
	testb	%sil, %sil
	je	.L530
.L529:
	xorl	%eax, %eax
	jmp	.L531
.L367:
	movl	$1, %eax
.L1184:
	addb	(%rdx), %al
	movb	$0, 4(%rdx)
	movb	%al, (%rdx)
	je	.L447
	decl	%eax
	cmpb	$0, 9(%rdx)
	movb	$1, 4(%rdx)
	movb	%al, (%rdx)
	leaq	9(%rdx), %rax
	je	.L448
.L449:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L449
.L448:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L447
.L450:
	movzbl	1(%rdx), %r10d
	testb	%r10b, %r10b
	je	.L2244
.L465:
	movzbl	6(%rdx), %eax
	movzbl	2(%rdx), %r8d
	movzbl	3(%rdx), %esi
.L457:
	decl	%r10d
	incl	%eax
	testb	%r8b, %r8b
	je	.L451
	leal	-1(%r8), %edi
	addb	-8(%rdx), %r8b
	decl	%eax
	movl	%r8d, %r9d
	subl	%edi, %r9d
	testb	%sil, %sil
	je	.L2245
.L452:
	movb	$0, 3(%rdx)
	addl	%esi, %eax
	testb	%dil, %dil
	je	.L2246
	decl	%edi
	movl	%r8d, %r9d
	xorl	%esi, %esi
	decl	%eax
	subl	%edi, %r9d
	testb	%sil, %sil
	jne	.L452
.L2245:
	testb	%dil, %dil
	je	.L454
	movl	%r8d, %r9d
	subl	%edi, %eax
.L454:
	movb	$0, 2(%rdx)
	xorl	%r8d, %r8d
	movb	%r9b, -8(%rdx)
.L451:
	testb	%sil, %sil
	je	.L456
	movzbl	-8(%rdx), %edi
	movb	$0, 3(%rdx)
	subl	%esi, %eax
	addl	%esi, %edi
	xorl	%esi, %esi
	movb	%dil, -8(%rdx)
.L456:
	testb	%r10b, %r10b
	jne	.L457
	movb	$0, 1(%rdx)
	movb	%al, 6(%rdx)
.L466:
	testb	%r8b, %r8b
	je	.L458
	movzbl	6(%rdx), %eax
	decl	%r8d
	incl	%eax
	testb	%sil, %sil
	je	.L2247
.L459:
	addb	%sil, -8(%rdx)
	subl	%esi, %eax
	movb	$0, 3(%rdx)
	testb	%r8b, %r8b
	je	.L2248
	xorl	%esi, %esi
	decl	%r8d
	incl	%eax
	testb	%sil, %sil
	jne	.L459
.L2247:
	addl	%r8d, %eax
.L461:
	movb	$0, 2(%rdx)
	movb	%al, 6(%rdx)
.L458:
	testb	%sil, %sil
	je	.L463
	addb	%sil, 6(%rdx)
	subq	$9, %rdx
	movb	$0, 12(%rdx)
	cmpb	$0, (%rdx)
	je	.L447
	movzbl	1(%rdx), %r10d
	testb	%r10b, %r10b
	jne	.L465
.L2244:
	movzbl	2(%rdx), %r8d
	movzbl	3(%rdx), %esi
	jmp	.L466
.L357:
	movzbl	6(%rdx), %esi
	testb	%sil, %sil
	jne	.L1176
	movzbl	(%rdx), %eax
	testb	%al, %al
	jne	.L1185
	jmp	.L365
.L2235:
	.cfi_offset 3, -32
	xorl	%esi, %esi
	jmp	.L407
.L2237:
	xorl	%esi, %esi
	jmp	.L414
.L2233:
	movzbl	2(%rdx), %r8d
	movzbl	3(%rdx), %esi
	jmp	.L419
.L416:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L402
	jmp	.L403
.L399:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L401
	jmp	.L397
.L2240:
	xorl	%esi, %esi
	jmp	.L433
.L2242:
	xorl	%esi, %esi
	jmp	.L440
.L2238:
	movzbl	3(%rdx), %r8d
	movzbl	2(%rdx), %esi
	jmp	.L445
.L442:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L428
	movzbl	(%rdx), %eax
	incb	6(%rdx)
	testb	%al, %al
	jne	.L446
	jmp	.L2249
.L425:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L427
	jmp	.L423
.L2246:
	.cfi_restore 3
	xorl	%esi, %esi
	jmp	.L454
.L2248:
	xorl	%esi, %esi
	jmp	.L461
.L463:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L450
	jmp	.L447
.L472:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L470
	jmp	.L471
.L480:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L478
	jmp	.L479
.L505:
	.cfi_offset 3, -32
	leaq	1(%rax), %rdx
	jmp	.L511
.L528:
	.cfi_restore 3
	testb	%sil, %sil
	jne	.L529
.L530:
	movb	$0, (%rdx)
	movb	$0, 3(%rdx)
.L525:
	movzbl	1(%rdx), %eax
	testb	%al, %al
	je	.L532
	addb	%al, 3(%rdx)
	movb	$0, 1(%rdx)
.L532:
	incb	(%rdx)
	subq	$9, %rdx
	movzbl	(%rdx), %eax
	testb	%al, %al
	jne	.L523
.L524:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L537
.L536:
	movzbl	3(%rax), %edx
	testb	%dl, %dl
	je	.L2250
	addb	%dl, -33(%rax)
	addq	$9, %rax
	movb	$0, -6(%rax)
	cmpb	$0, (%rax)
	jne	.L536
.L537:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L541
.L542:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L542
.L541:
	cmpb	$0, 5(%rdx)
	je	.L543
	movb	$0, 5(%rdx)
.L543:
	addb	$15, 9(%rdx)
	leaq	9(%rdx), %rax
	jne	.L2169
	jmp	.L545
.L546:
	addq	$9, %rax
.L2169:
	cmpb	$0, (%rax)
	jne	.L546
	decb	-9(%rax)
	cmpb	$0, -18(%rax)
	leaq	-18(%rax), %rdx
	je	.L547
.L548:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L548
.L547:
	decb	9(%rdx)
	leaq	9(%rdx), %rax
	jne	.L2169
.L545:
	movb	$1, (%rax)
.L550:
	movzbl	3(%rax), %edx
	testb	%dl, %dl
	je	.L574
	subb	%dl, (%rax)
.L574:
	movzbl	(%rax), %edx
	movb	$1, 3(%rax)
	testb	%dl, %dl
	je	.L554
	movzbl	4(%rax), %esi
	decl	%edx
	movb	$0, 3(%rax)
	movb	%dl, (%rax)
	testb	%sil, %sil
	je	.L2170
	addl	%edx, %esi
	movb	$0, 4(%rax)
	movb	%sil, (%rax)
.L2170:
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L554
.L553:
	decl	%edx
	incb	4(%rax)
	cmpb	$0, -9(%rax)
	movb	%dl, (%rax)
	leaq	-9(%rax), %rdx
	je	.L555
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L556:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L556
.L555:
	cmpb	$0, 9(%rdx)
	movb	$1, 4(%rdx)
	leaq	9(%rdx), %rax
	je	.L557
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L558:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L558
.L557:
	movzbl	(%rax), %edx
	incb	1(%rax)
	testb	%dl, %dl
	jne	.L553
.L554:
	movzbl	4(%rax), %esi
	movl	%ecx, %edx
	movb	$1, 4(%rax)
	subl	%esi, %edx
	testb	%sil, %sil
	cmove	%ecx, %edx
	movb	%dl, (%rax)
	testb	%dl, %dl
	je	.L563
	movzbl	3(%rax), %esi
	decl	%edx
	movb	$0, 4(%rax)
	movb	%dl, (%rax)
	testb	%sil, %sil
	je	.L2171
	addl	%edx, %esi
	movb	$0, 3(%rax)
	movb	%sil, (%rax)
.L2171:
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L563
.L562:
	decl	%edx
	incb	3(%rax)
	cmpb	$0, -9(%rax)
	movb	%dl, (%rax)
	leaq	-9(%rax), %rdx
	je	.L564
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L565:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L565
.L564:
	cmpb	$0, 9(%rdx)
	movb	$1, 3(%rdx)
	leaq	9(%rdx), %rax
	je	.L566
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L567:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L567
.L566:
	movzbl	(%rax), %edx
	movb	$1, 1(%rax)
	testb	%dl, %dl
	jne	.L562
.L563:
	movb	$1, (%rax)
	leaq	1(%rax), %rdx
	movzbl	1(%rax), %eax
	testb	%al, %al
	je	.L568
.L571:
	decl	%eax
	cmpb	$0, -1(%rdx)
	movb	%al, (%rdx)
	leaq	-1(%rdx), %rax
	je	.L569
.L570:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L570
.L569:
	leaq	-8(%rax), %rdx
	movzbl	-8(%rax), %eax
	testb	%al, %al
	jne	.L571
.L568:
	cmpb	$0, 8(%rdx)
	leaq	8(%rdx), %rax
	jne	.L550
	cmpb	$0, -1(%rdx)
	leaq	-1(%rdx), %rax
	je	.L575
.L576:
	subq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L576
.L575:
	movzbl	3(%rax), %edx
	testb	%dl, %dl
	je	.L577
	addb	%dl, (%rax)
	movb	$0, 3(%rax)
.L577:
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L578
	decl	%edx
	incb	3(%rax)
	cmpb	$0, 9(%rax)
	movb	%dl, (%rax)
	leaq	9(%rax), %rdx
	je	.L579
.L583:
	movzbl	1(%rdx), %eax
	movzbl	4(%rdx), %esi
	incl	%eax
	movb	%al, 1(%rdx)
	testb	%sil, %sil
	je	.L580
	subl	%esi, %eax
	movb	$0, 4(%rdx)
	movb	%al, 1(%rdx)
.L580:
	movzbl	1(%rdx), %eax
	testb	%al, %al
	je	.L581
	addb	%al, 4(%rdx)
	addq	$9, %rdx
	movb	$0, -8(%rdx)
	cmpb	$0, (%rdx)
	jne	.L583
.L579:
	incb	-8(%rdx)
	cmpb	$0, -9(%rdx)
	leaq	-9(%rdx), %rax
	je	.L585
.L584:
	movzbl	1(%rax), %r10d
	testb	%r10b, %r10b
	je	.L2251
	movzbl	2(%rax), %edx
	movzbl	3(%rax), %r8d
	movzbl	4(%rax), %esi
.L592:
	decl	%r10d
	incl	%edx
	testb	%r8b, %r8b
	je	.L586
	leal	-1(%r8), %edi
	addb	-8(%rax), %r8b
	decl	%edx
	movl	%r8d, %r9d
	subl	%edi, %r9d
	testb	%sil, %sil
	je	.L2252
.L587:
	movb	$0, 4(%rax)
	addl	%esi, %edx
	testb	%dil, %dil
	je	.L2253
	decl	%edi
	movl	%r8d, %r9d
	xorl	%esi, %esi
	decl	%edx
	subl	%edi, %r9d
	testb	%sil, %sil
	jne	.L587
.L2252:
	testb	%dil, %dil
	je	.L589
	movl	%r8d, %r9d
	subl	%edi, %edx
.L589:
	movb	$0, 3(%rax)
	xorl	%r8d, %r8d
	movb	%r9b, -8(%rax)
.L586:
	testb	%sil, %sil
	je	.L591
	movzbl	-8(%rax), %edi
	movb	$0, 4(%rax)
	subl	%esi, %edx
	addl	%esi, %edi
	xorl	%esi, %esi
	movb	%dil, -8(%rax)
.L591:
	testb	%r10b, %r10b
	jne	.L592
	movb	$0, 1(%rax)
	movb	%dl, 2(%rax)
.L601:
	testb	%r8b, %r8b
	je	.L593
	movzbl	2(%rax), %edx
	decl	%r8d
	incl	%edx
	testb	%sil, %sil
	je	.L2254
.L594:
	addb	%sil, -8(%rax)
	subl	%esi, %edx
	movb	$0, 4(%rax)
	testb	%r8b, %r8b
	je	.L2255
	xorl	%esi, %esi
	decl	%r8d
	incl	%edx
	testb	%sil, %sil
	jne	.L594
.L2254:
	addl	%r8d, %edx
.L596:
	movb	$0, 3(%rax)
	movb	%dl, 2(%rax)
.L593:
	testb	%sil, %sil
	je	.L598
	addb	%sil, 2(%rax)
	subq	$9, %rax
	movb	$0, 13(%rax)
	cmpb	$0, (%rax)
	jne	.L584
.L585:
	movzbl	4(%rax), %edx
	testb	%dl, %dl
	jne	.L1183
.L2200:
	movzbl	(%rax), %edx
	testb	%dl, %dl
	jne	.L627
.L603:
	cmpb	$0, 9(%rax)
	leaq	9(%rax), %rdx
	je	.L629
.L628:
	cmpb	$0, 3(%rdx)
	je	.L634
	movb	$0, 3(%rdx)
.L634:
	cmpb	$0, 4(%rdx)
	je	.L630
	movb	$0, 4(%rdx)
.L630:
	cmpb	$0, 5(%rdx)
	je	.L631
	movb	$0, 5(%rdx)
	addq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L628
.L629:
	cmpb	$0, -9(%rdx)
	leaq	-9(%rdx), %rsi
	je	.L635
.L636:
	subq	$9, %rsi
	cmpb	$0, (%rsi)
	jne	.L636
.L635:
	cmpb	$0, 3(%rsi)
	je	.L637
	movb	$0, 3(%rsi)
.L637:
	cmpb	$0, 4(%rsi)
	je	.L638
	movb	$0, 4(%rsi)
.L638:
	cmpb	$0, 9(%rsi)
	leaq	9(%rsi), %rax
	je	.L640
.L639:
	movzbl	7(%rax), %edx
	testb	%dl, %dl
	je	.L644
	addb	%dl, 1(%rax)
	movb	$0, 7(%rax)
.L644:
	movzbl	1(%rax), %edx
	testb	%dl, %dl
	je	.L641
	addb	%dl, 7(%rax)
	addb	%dl, 3(%rax)
	addq	$9, %rax
	movb	$0, -8(%rax)
	cmpb	$0, (%rax)
	jne	.L639
.L640:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L645
.L646:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L646
.L645:
	movzbl	4(%rdx), %eax
	leal	1(%rax), %esi
	movzbl	5(%rdx), %eax
	movb	%sil, 4(%rdx)
	testb	%al, %al
	je	.L647
	subl	%eax, %esi
	addb	%al, (%rdx)
	movb	%sil, 4(%rdx)
	movzbl	7(%rdx), %esi
	movb	$0, 5(%rdx)
	testb	%sil, %sil
	je	.L648
	xorl	%eax, %eax
.L1173:
	movzbl	(%rdx), %r8d
	movzbl	4(%rdx), %edi
	decl	%esi
	testb	%r8b, %r8b
	je	.L649
.L652:
	movb	$0, (%rdx)
	leal	(%rdi,%r8,2), %edi
	addl	%r8d, %eax
.L649:
	testb	%al, %al
	je	.L650
	addb	%al, (%rdx)
.L650:
	decl	%edi
	testb	%sil, %sil
	je	.L651
	movzbl	(%rdx), %r8d
	decl	%esi
	movl	$1, %eax
	testb	%r8b, %r8b
	jne	.L652
	addb	%al, (%rdx)
	jmp	.L650
.L2250:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L536
	jmp	.L537
.L2243:
	.cfi_offset 3, -32
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L515
	movzbl	1(%rdx), %eax
	testb	%al, %al
	jne	.L2256
.L520:
	cmpb	$0, 8(%rdx)
	movb	$1, (%rdx)
	leaq	8(%rdx), %rax
	jne	.L522
	movq	(%rsp), %rbx
	.cfi_restore 3
	jmp	.L503
.L2253:
	xorl	%esi, %esi
	jmp	.L589
.L2255:
	xorl	%esi, %esi
	jmp	.L596
.L2251:
	movzbl	3(%rax), %r8d
	movzbl	4(%rax), %esi
	jmp	.L601
.L578:
	movzbl	4(%rax), %edx
	testb	%dl, %dl
	je	.L603
.L1183:
	addb	%dl, (%rax)
	movb	$0, 4(%rax)
.L2172:
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L603
.L627:
	decl	%edx
	incb	4(%rax)
	cmpb	$0, 9(%rax)
	movb	%dl, (%rax)
	leaq	9(%rax), %rdx
	je	.L604
.L608:
	movzbl	1(%rdx), %eax
	movzbl	3(%rdx), %esi
	incl	%eax
	movb	%al, 1(%rdx)
	testb	%sil, %sil
	je	.L605
	subl	%esi, %eax
	movb	$0, 3(%rdx)
	movb	%al, 1(%rdx)
.L605:
	movzbl	1(%rdx), %eax
	testb	%al, %al
	je	.L606
	addb	%al, 3(%rdx)
	addq	$9, %rdx
	movb	$0, -8(%rdx)
	cmpb	$0, (%rdx)
	jne	.L608
.L604:
	incb	-8(%rdx)
	cmpb	$0, -9(%rdx)
	leaq	-9(%rdx), %rax
	je	.L610
.L609:
	movzbl	1(%rax), %r10d
	testb	%r10b, %r10b
	je	.L2257
	movzbl	2(%rax), %edx
	movzbl	4(%rax), %r8d
	movzbl	3(%rax), %esi
.L617:
	decl	%r10d
	incl	%edx
	testb	%r8b, %r8b
	je	.L611
	leal	-1(%r8), %edi
	addb	-8(%rax), %r8b
	decl	%edx
	movl	%r8d, %r9d
	subl	%edi, %r9d
	testb	%sil, %sil
	je	.L2258
.L612:
	movb	$0, 3(%rax)
	addl	%esi, %edx
	testb	%dil, %dil
	je	.L2259
	decl	%edi
	movl	%r8d, %r9d
	xorl	%esi, %esi
	decl	%edx
	subl	%edi, %r9d
	testb	%sil, %sil
	jne	.L612
.L2258:
	testb	%dil, %dil
	je	.L614
	movl	%r8d, %r9d
	subl	%edi, %edx
.L614:
	movb	$0, 4(%rax)
	xorl	%r8d, %r8d
	movb	%r9b, -8(%rax)
.L611:
	testb	%sil, %sil
	je	.L616
	movzbl	-8(%rax), %edi
	movb	$0, 3(%rax)
	subl	%esi, %edx
	addl	%esi, %edi
	xorl	%esi, %esi
	movb	%dil, -8(%rax)
.L616:
	testb	%r10b, %r10b
	jne	.L617
	movb	$0, 1(%rax)
	movb	%dl, 2(%rax)
.L626:
	testb	%r8b, %r8b
	je	.L618
	movzbl	2(%rax), %edx
	decl	%r8d
	incl	%edx
	testb	%sil, %sil
	je	.L2260
.L619:
	addb	%sil, -8(%rax)
	subl	%esi, %edx
	movb	$0, 3(%rax)
	testb	%r8b, %r8b
	je	.L2261
	xorl	%esi, %esi
	decl	%r8d
	incl	%edx
	testb	%sil, %sil
	jne	.L619
.L2260:
	addl	%r8d, %edx
.L621:
	movb	$0, 4(%rax)
	movb	%dl, 2(%rax)
.L618:
	testb	%sil, %sil
	je	.L623
	addb	%sil, 2(%rax)
	subq	$9, %rax
	movb	$0, 12(%rax)
	cmpb	$0, (%rax)
	jne	.L609
.L610:
	incb	5(%rax)
	jmp	.L2172
.L2259:
	xorl	%esi, %esi
	jmp	.L614
.L2261:
	xorl	%esi, %esi
	jmp	.L621
.L2257:
	movzbl	4(%rax), %r8d
	movzbl	3(%rax), %esi
	jmp	.L626
.L598:
	subq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L584
	movzbl	4(%rax), %edx
	testb	%dl, %dl
	jne	.L1183
	jmp	.L2200
.L581:
	addq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L583
	jmp	.L579
.L631:
	addq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L628
	jmp	.L629
.L606:
	addq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L608
	jmp	.L604
.L623:
	subq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L609
	incb	5(%rax)
	jmp	.L2172
.L641:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L639
	jmp	.L640
.L651:
	movb	%dil, 4(%rdx)
	movb	$0, 5(%rdx)
	movb	$1, 7(%rdx)
.L648:
	movzbl	(%rdx), %eax
	testb	%al, %al
	je	.L654
	addb	%al, 5(%rdx)
.L654:
	movzbl	4(%rdx), %esi
	movl	%ecx, %eax
	movb	$1, 4(%rdx)
	subl	%esi, %eax
	testb	%sil, %sil
	cmove	%ecx, %eax
	movb	%al, (%rdx)
	testb	%al, %al
	je	.L656
	movq	%rbx, (%rsp)
	.cfi_offset 3, -32
.L736:
	decl	%eax
	decb	4(%rdx)
	cmpb	$0, 9(%rdx)
	movb	%al, (%rdx)
	leaq	9(%rdx), %rax
	je	.L658
.L657:
	movzbl	3(%rax), %edx
	testb	%dl, %dl
	je	.L681
	subb	%dl, (%rax)
.L681:
	movzbl	(%rax), %edx
	movb	$1, 3(%rax)
	testb	%dl, %dl
	je	.L662
	movzbl	2(%rax), %esi
	decl	%edx
	movb	$0, 3(%rax)
	movb	%dl, (%rax)
	testb	%sil, %sil
	je	.L2173
	addl	%edx, %esi
	movb	$0, 2(%rax)
	movb	%sil, (%rax)
.L2173:
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L662
	.p2align 4,,10
	.p2align 3
.L661:
	decl	%edx
	incb	2(%rax)
	cmpb	$0, -9(%rax)
	movb	%dl, (%rax)
	leaq	-9(%rax), %rdx
	je	.L663
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L664:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L664
.L663:
	cmpb	$0, 9(%rdx)
	movb	$1, 4(%rdx)
	leaq	9(%rdx), %rax
	je	.L665
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L666:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L666
.L665:
	movzbl	(%rax), %edx
	incb	1(%rax)
	testb	%dl, %dl
	jne	.L661
.L662:
	movzbl	2(%rax), %esi
	movl	%ecx, %edx
	movb	$1, 2(%rax)
	subl	%esi, %edx
	testb	%sil, %sil
	cmove	%ecx, %edx
	movb	%dl, (%rax)
	testb	%dl, %dl
	je	.L671
	movzbl	3(%rax), %esi
	decl	%edx
	movb	$0, 2(%rax)
	movb	%dl, (%rax)
	testb	%sil, %sil
	je	.L2174
	addl	%edx, %esi
	movb	$0, 3(%rax)
	movb	%sil, (%rax)
.L2174:
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L671
	.p2align 4,,10
	.p2align 3
.L670:
	decl	%edx
	incb	3(%rax)
	cmpb	$0, -9(%rax)
	movb	%dl, (%rax)
	leaq	-9(%rax), %rdx
	je	.L672
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L673:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L673
.L672:
	cmpb	$0, 9(%rdx)
	movb	$1, 3(%rdx)
	leaq	9(%rdx), %rax
	je	.L674
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L675:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L675
.L674:
	movzbl	(%rax), %edx
	movb	$1, 1(%rax)
	testb	%dl, %dl
	jne	.L670
.L671:
	movb	$1, (%rax)
	leaq	1(%rax), %rdx
	movzbl	1(%rax), %eax
	testb	%al, %al
	je	.L676
.L679:
	decl	%eax
	cmpb	$0, -1(%rdx)
	movb	%al, (%rdx)
	leaq	-1(%rdx), %rax
	je	.L677
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L678:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L678
.L677:
	leaq	-8(%rax), %rdx
	movzbl	-8(%rax), %eax
	testb	%al, %al
	jne	.L679
.L676:
	cmpb	$0, 8(%rdx)
	leaq	8(%rdx), %rax
	jne	.L657
.L658:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L682
.L683:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L683
.L682:
	movzbl	3(%rdx), %eax
	testb	%al, %al
	je	.L684
	addb	%al, (%rdx)
	movb	$0, 3(%rdx)
.L684:
	movzbl	(%rdx), %eax
	testb	%al, %al
	je	.L685
	decl	%eax
	incb	3(%rdx)
	cmpb	$0, 9(%rdx)
	movb	%al, (%rdx)
	leaq	9(%rdx), %rax
	je	.L686
.L690:
	movzbl	1(%rax), %ebx
	movzbl	2(%rax), %esi
	leal	1(%rbx), %edx
	movb	%dl, 1(%rax)
	testb	%sil, %sil
	je	.L687
	subl	%esi, %edx
	movb	$0, 2(%rax)
	movb	%dl, 1(%rax)
.L687:
	movzbl	1(%rax), %edx
	testb	%dl, %dl
	je	.L688
	addb	%dl, 2(%rax)
	addq	$9, %rax
	movb	$0, -8(%rax)
	cmpb	$0, (%rax)
	jne	.L690
.L686:
	incb	-8(%rax)
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L692
.L691:
	movzbl	1(%rdx), %r10d
	testb	%r10b, %r10b
	je	.L2262
.L707:
	movzbl	5(%rdx), %eax
	movzbl	3(%rdx), %r8d
	movzbl	2(%rdx), %esi
	.p2align 4,,10
	.p2align 3
.L699:
	decl	%r10d
	incl	%eax
	testb	%r8b, %r8b
	je	.L693
	leal	-1(%r8), %edi
	addb	-8(%rdx), %r8b
	decl	%eax
	movl	%r8d, %r9d
	subl	%edi, %r9d
	testb	%sil, %sil
	je	.L2263
.L694:
	movb	$0, 2(%rdx)
	addl	%esi, %eax
	testb	%dil, %dil
	je	.L2264
	decl	%edi
	movl	%r8d, %r9d
	xorl	%esi, %esi
	decl	%eax
	subl	%edi, %r9d
	testb	%sil, %sil
	jne	.L694
.L2263:
	testb	%dil, %dil
	je	.L696
	movl	%r8d, %r9d
	subl	%edi, %eax
.L696:
	movb	$0, 3(%rdx)
	xorl	%r8d, %r8d
	movb	%r9b, -8(%rdx)
.L693:
	testb	%sil, %sil
	je	.L698
	movzbl	-8(%rdx), %edi
	movb	$0, 2(%rdx)
	subl	%esi, %eax
	addl	%esi, %edi
	xorl	%esi, %esi
	movb	%dil, -8(%rdx)
.L698:
	testb	%r10b, %r10b
	jne	.L699
	movb	$0, 1(%rdx)
	movb	%al, 5(%rdx)
.L708:
	testb	%r8b, %r8b
	je	.L700
	movzbl	5(%rdx), %eax
	decl	%r8d
	incl	%eax
	testb	%sil, %sil
	je	.L2265
.L701:
	addb	%sil, -8(%rdx)
	subl	%esi, %eax
	movb	$0, 2(%rdx)
	testb	%r8b, %r8b
	je	.L2266
	xorl	%esi, %esi
	decl	%r8d
	incl	%eax
	testb	%sil, %sil
	jne	.L701
.L2265:
	addl	%r8d, %eax
.L703:
	movb	$0, 3(%rdx)
	movb	%al, 5(%rdx)
.L700:
	testb	%sil, %sil
	je	.L705
	addb	%sil, 5(%rdx)
	subq	$9, %rdx
	movb	$0, 11(%rdx)
	cmpb	$0, (%rdx)
	jne	.L691
.L692:
	cmpb	$0, 5(%rdx)
	je	.L709
	movb	$0, 5(%rdx)
.L709:
	movzbl	7(%rdx), %eax
	testb	%al, %al
	je	.L710
	addb	%al, (%rdx)
	movb	$0, 7(%rdx)
.L710:
	movzbl	(%rdx), %eax
	testb	%al, %al
	je	.L711
	addb	%al, 7(%rdx)
	addb	%al, 5(%rdx)
	movb	$0, (%rdx)
.L711:
	movzbl	4(%rdx), %eax
	testb	%al, %al
	je	.L712
.L1182:
	addb	%al, (%rdx)
	movb	$0, 4(%rdx)
.L712:
	movzbl	(%rdx), %eax
	testb	%al, %al
	je	.L713
	decl	%eax
	incb	4(%rdx)
	cmpb	$0, 9(%rdx)
	movb	%al, (%rdx)
	leaq	9(%rdx), %rax
	je	.L714
.L718:
	movzbl	1(%rax), %ebx
	movzbl	3(%rax), %esi
	leal	1(%rbx), %edx
	movb	%dl, 1(%rax)
	testb	%sil, %sil
	je	.L715
	subl	%esi, %edx
	movb	$0, 3(%rax)
	movb	%dl, 1(%rax)
.L715:
	movzbl	1(%rax), %edx
	testb	%dl, %dl
	je	.L716
	addb	%dl, 3(%rax)
	addq	$9, %rax
	movb	$0, -8(%rax)
	cmpb	$0, (%rax)
	jne	.L718
.L714:
	incb	-8(%rax)
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L713
.L719:
	movzbl	1(%rdx), %r10d
	testb	%r10b, %r10b
	je	.L2267
.L734:
	movzbl	5(%rdx), %eax
	movzbl	2(%rdx), %r8d
	movzbl	3(%rdx), %esi
	.p2align 4,,10
	.p2align 3
.L726:
	decl	%r10d
	incl	%eax
	testb	%r8b, %r8b
	je	.L720
	leal	-1(%r8), %edi
	addb	-8(%rdx), %r8b
	decl	%eax
	movl	%r8d, %r9d
	subl	%edi, %r9d
	testb	%sil, %sil
	je	.L2268
.L721:
	movb	$0, 3(%rdx)
	addl	%esi, %eax
	testb	%dil, %dil
	je	.L2269
	decl	%edi
	movl	%r8d, %r9d
	xorl	%esi, %esi
	decl	%eax
	subl	%edi, %r9d
	testb	%sil, %sil
	jne	.L721
.L2268:
	testb	%dil, %dil
	je	.L723
	movl	%r8d, %r9d
	subl	%edi, %eax
.L723:
	movb	$0, 2(%rdx)
	xorl	%r8d, %r8d
	movb	%r9b, -8(%rdx)
.L720:
	testb	%sil, %sil
	je	.L725
	movzbl	-8(%rdx), %edi
	movb	$0, 3(%rdx)
	subl	%esi, %eax
	addl	%esi, %edi
	xorl	%esi, %esi
	movb	%dil, -8(%rdx)
.L725:
	testb	%r10b, %r10b
	jne	.L726
	movb	$0, 1(%rdx)
	movb	%al, 5(%rdx)
.L735:
	testb	%r8b, %r8b
	je	.L727
	movzbl	5(%rdx), %eax
	decl	%r8d
	incl	%eax
	testb	%sil, %sil
	je	.L2270
.L728:
	addb	%sil, -8(%rdx)
	subl	%esi, %eax
	movb	$0, 3(%rdx)
	testb	%r8b, %r8b
	je	.L2271
	xorl	%esi, %esi
	decl	%r8d
	incl	%eax
	testb	%sil, %sil
	jne	.L728
.L2270:
	addl	%r8d, %eax
.L730:
	movb	$0, 2(%rdx)
	movb	%al, 5(%rdx)
.L727:
	testb	%sil, %sil
	je	.L732
	addb	%sil, 5(%rdx)
	subq	$9, %rdx
	movb	$0, 12(%rdx)
	cmpb	$0, (%rdx)
	jne	.L719
.L713:
	cmpb	$0, 4(%rdx)
	je	.L2175
	movzbl	(%rdx), %eax
	movb	$0, 4(%rdx)
	testb	%al, %al
	jne	.L736
.L2175:
	movzbl	(%rdx), %eax
	movq	(%rsp), %rbx
	.cfi_restore 3
	testb	%al, %al
	jne	.L2272
.L737:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L761
.L760:
	cmpb	$0, 2(%rax)
	je	.L765
	movb	$0, 2(%rax)
.L765:
	cmpb	$0, 3(%rax)
	je	.L762
	movb	$0, 3(%rax)
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L760
.L761:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L766
.L767:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L767
.L766:
	cmpb	$0, 3(%rdx)
	je	.L768
	movb	$0, 3(%rdx)
.L768:
	cmpb	$0, 4(%rdx)
	je	.L769
	movb	$0, 4(%rdx)
.L769:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L771
.L770:
	movzbl	5(%rax), %edx
	testb	%dl, %dl
	je	.L775
	addb	%dl, 1(%rax)
	movb	$0, 5(%rax)
.L775:
	movzbl	1(%rax), %edx
	testb	%dl, %dl
	je	.L772
	addb	%dl, 5(%rax)
	addb	%dl, 2(%rax)
	addq	$9, %rax
	movb	$0, -8(%rax)
	cmpb	$0, (%rax)
	jne	.L770
.L771:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L776
.L777:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L777
.L776:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L779
.L778:
	movzbl	6(%rax), %edx
	testb	%dl, %dl
	je	.L783
	addb	%dl, 1(%rax)
	movb	$0, 6(%rax)
.L783:
	movzbl	1(%rax), %edx
	testb	%dl, %dl
	je	.L780
	addb	%dl, 6(%rax)
	addb	%dl, 3(%rax)
	addq	$9, %rax
	movb	$0, -8(%rax)
	cmpb	$0, (%rax)
	jne	.L778
.L779:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L784
.L785:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L785
.L784:
	addb	$15, 9(%rdx)
	leaq	9(%rdx), %rax
	jne	.L2177
	jmp	.L787
.L788:
	addq	$9, %rax
.L2177:
	cmpb	$0, (%rax)
	jne	.L788
	cmpb	$0, 1(%rax)
	movb	$1, (%rax)
	je	.L789
	movb	$0, 1(%rax)
.L789:
	cmpb	$0, 2(%rax)
	je	.L790
	movb	$0, 2(%rax)
.L790:
	cmpb	$0, 3(%rax)
	je	.L791
	movb	$0, 3(%rax)
.L791:
	cmpb	$0, 4(%rax)
	je	.L792
	movb	$0, 4(%rax)
.L792:
	cmpb	$0, 5(%rax)
	je	.L793
	movb	$0, 5(%rax)
.L793:
	cmpb	$0, 6(%rax)
	je	.L794
	movb	$0, 6(%rax)
.L794:
	cmpb	$0, 7(%rax)
	je	.L795
	movb	$0, 7(%rax)
.L795:
	cmpb	$0, 8(%rax)
	je	.L796
	movb	$0, 8(%rax)
.L796:
	cmpb	$0, 9(%rax)
	je	.L797
	movb	$0, 9(%rax)
.L797:
	movq	%rax, %rdx
.L798:
	movq	%rdx, %rax
	leaq	-9(%rdx), %rdx
	cmpb	$0, -9(%rax)
	jne	.L798
	decb	9(%rdx)
	jne	.L2177
.L787:
	movb	$1, (%rax)
.L800:
	incb	1(%rax)
	movq	%rax, %rdx
	leaq	9(%rax), %rax
	cmpb	$0, 9(%rdx)
	jne	.L800
	cmpb	$0, -9(%rax)
	je	.L801
.L802:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L802
.L801:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L803
	movq	%rbx, (%rsp)
	.cfi_offset 3, -32
.L822:
	movzbl	1(%rax), %ebx
	movzbl	5(%rax), %edx
	leal	-1(%rbx), %esi
	movb	%sil, 1(%rax)
	testb	%dl, %dl
	je	.L804
	addl	%esi, %edx
	movb	$0, 5(%rax)
	movb	%dl, 1(%rax)
.L804:
	movzbl	1(%rax), %edx
	testb	%dl, %dl
	je	.L805
	decl	%edx
	incb	5(%rax)
	movb	%dl, 1(%rax)
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L806
.L810:
	movzbl	2(%rax), %esi
	decl	%edx
	movb	%dl, (%rax)
	testb	%sil, %sil
	je	.L807
	addl	%edx, %esi
	movb	$0, 2(%rax)
	movb	%sil, (%rax)
.L807:
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L808
	addb	%dl, 2(%rax)
	addb	%dl, 4(%rax)
.L808:
	movb	$1, (%rax)
	addq	$9, %rax
	movzbl	(%rax), %edx
	testb	%dl, %dl
	jne	.L810
.L806:
	cmpb	$0, -8(%rax)
	leaq	-8(%rax), %rdx
	je	.L811
.L812:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L812
.L811:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L813
.L814:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L814
.L813:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L816
.L815:
	movzbl	1(%rdx), %eax
	testb	%al, %al
	je	.L2273
	addb	%al, 10(%rdx)
	subq	$9, %rdx
	movb	$0, 10(%rdx)
	cmpb	$0, (%rdx)
	jne	.L815
.L816:
	movzbl	1(%rdx), %eax
	testb	%al, %al
	je	.L820
.L2280:
	addb	%al, 10(%rdx)
	movl	$1, %eax
	cmpb	$0, 8(%rdx)
	movw	%ax, (%rdx)
	leaq	8(%rdx), %rax
	jne	.L822
	movq	(%rsp), %rbx
	.cfi_restore 3
.L803:
	leaq	-9(%rax), %rdx
	movzbl	-9(%rax), %eax
	testb	%al, %al
	je	.L824
.L823:
	cmpb	$0, 1(%rdx)
	je	.L835
	movb	$0, 1(%rdx)
.L835:
	movzbl	4(%rdx), %esi
	decl	%eax
	movb	%al, (%rdx)
	testb	%sil, %sil
	je	.L825
.L831:
	movzbl	1(%rdx), %edi
	decl	%esi
	incl	%eax
	testb	%dil, %dil
	je	.L827
	addb	%dil, -5(%rdx)
	movb	$0, 1(%rdx)
	subb	%dil, %al
	je	.L828
.L827:
	addb	%al, 1(%rdx)
	testb	%sil, %sil
	je	.L830
.L829:
	xorl	%eax, %eax
	jmp	.L831
.L656:
	movb	$1, (%rdx)
	movb	$0, 4(%rdx)
	movzbl	(%rdx), %eax
	testb	%al, %al
	je	.L737
.L2272:
	decl	%eax
	incb	4(%rdx)
	cmpb	$0, 5(%rdx)
	movb	%al, (%rdx)
	je	.L738
	movb	$0, 5(%rdx)
.L738:
	movzbl	7(%rdx), %esi
	testb	%sil, %sil
	je	.L739
	addl	%eax, %esi
	movb	$0, 7(%rdx)
	movb	%sil, (%rdx)
.L739:
	movzbl	(%rdx), %eax
	testb	%al, %al
	je	.L740
	addb	%al, 7(%rdx)
	addb	%al, 5(%rdx)
	movb	$0, (%rdx)
.L740:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L741
.L742:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L742
.L741:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L737
.L743:
	movzbl	1(%rdx), %r10d
	testb	%r10b, %r10b
	je	.L2274
.L758:
	movzbl	5(%rdx), %eax
	movzbl	2(%rdx), %r8d
	movzbl	3(%rdx), %esi
.L750:
	decl	%r10d
	incl	%eax
	testb	%r8b, %r8b
	je	.L744
	leal	-1(%r8), %edi
	addb	-8(%rdx), %r8b
	decl	%eax
	movl	%r8d, %r9d
	subl	%edi, %r9d
	testb	%sil, %sil
	je	.L2275
.L745:
	movb	$0, 3(%rdx)
	addl	%esi, %eax
	testb	%dil, %dil
	je	.L2276
	decl	%edi
	movl	%r8d, %r9d
	xorl	%esi, %esi
	decl	%eax
	subl	%edi, %r9d
	testb	%sil, %sil
	jne	.L745
.L2275:
	testb	%dil, %dil
	je	.L747
	movl	%r8d, %r9d
	subl	%edi, %eax
.L747:
	movb	$0, 2(%rdx)
	xorl	%r8d, %r8d
	movb	%r9b, -8(%rdx)
.L744:
	testb	%sil, %sil
	je	.L749
	movzbl	-8(%rdx), %edi
	movb	$0, 3(%rdx)
	subl	%esi, %eax
	addl	%esi, %edi
	xorl	%esi, %esi
	movb	%dil, -8(%rdx)
.L749:
	testb	%r10b, %r10b
	jne	.L750
	movb	$0, 1(%rdx)
	movb	%al, 5(%rdx)
.L759:
	testb	%r8b, %r8b
	je	.L751
	movzbl	5(%rdx), %eax
	decl	%r8d
	incl	%eax
	testb	%sil, %sil
	je	.L2277
.L752:
	addb	%sil, -8(%rdx)
	subl	%esi, %eax
	movb	$0, 3(%rdx)
	testb	%r8b, %r8b
	je	.L2278
	xorl	%esi, %esi
	decl	%r8d
	incl	%eax
	testb	%sil, %sil
	jne	.L752
.L2277:
	addl	%r8d, %eax
.L754:
	movb	$0, 2(%rdx)
	movb	%al, 5(%rdx)
.L751:
	testb	%sil, %sil
	je	.L756
	addb	%sil, 5(%rdx)
	subq	$9, %rdx
	movb	$0, 12(%rdx)
	cmpb	$0, (%rdx)
	je	.L737
	movzbl	1(%rdx), %r10d
	testb	%r10b, %r10b
	jne	.L758
.L2274:
	movzbl	2(%rdx), %r8d
	movzbl	3(%rdx), %esi
	jmp	.L759
.L2276:
	xorl	%esi, %esi
	jmp	.L747
.L2278:
	xorl	%esi, %esi
	jmp	.L754
.L647:
	movzbl	7(%rdx), %esi
	testb	%sil, %sil
	jne	.L1173
	jmp	.L648
.L2269:
	.cfi_offset 3, -32
	xorl	%esi, %esi
	jmp	.L723
.L2264:
	xorl	%esi, %esi
	jmp	.L696
.L2271:
	xorl	%esi, %esi
	jmp	.L730
.L2266:
	xorl	%esi, %esi
	jmp	.L703
.L732:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	je	.L713
	movzbl	1(%rdx), %r10d
	testb	%r10b, %r10b
	jne	.L734
.L2267:
	movzbl	2(%rdx), %r8d
	movzbl	3(%rdx), %esi
	jmp	.L735
.L716:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L718
	jmp	.L714
.L688:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L690
	jmp	.L686
.L705:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	je	.L692
	movzbl	1(%rdx), %r10d
	testb	%r10b, %r10b
	jne	.L707
.L2262:
	movzbl	3(%rdx), %r8d
	movzbl	2(%rdx), %esi
	jmp	.L708
.L685:
	movzbl	4(%rdx), %eax
	testb	%al, %al
	jne	.L1182
	jmp	.L713
.L762:
	.cfi_restore 3
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L760
	jmp	.L761
.L772:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L770
	jmp	.L771
.L780:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L778
	jmp	.L779
.L756:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L743
	jmp	.L737
.L805:
	.cfi_offset 3, -32
	leaq	1(%rax), %rdx
	jmp	.L811
.L828:
	.cfi_restore 3
	testb	%sil, %sil
	jne	.L829
.L830:
	movb	$0, (%rdx)
	movb	$0, 4(%rdx)
.L825:
	movzbl	1(%rdx), %eax
	testb	%al, %al
	je	.L832
	addb	%al, 4(%rdx)
	movb	$0, 1(%rdx)
.L832:
	incb	(%rdx)
	subq	$9, %rdx
	movzbl	(%rdx), %eax
	testb	%al, %al
	jne	.L823
.L824:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L836
.L837:
	incb	1(%rax)
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L837
.L836:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L838
.L839:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L839
.L838:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L840
	movq	%rbx, (%rsp)
	.cfi_offset 3, -32
.L859:
	movzbl	1(%rax), %ebx
	movzbl	6(%rax), %edx
	leal	-1(%rbx), %esi
	movb	%sil, 1(%rax)
	testb	%dl, %dl
	je	.L841
	addl	%esi, %edx
	movb	$0, 6(%rax)
	movb	%dl, 1(%rax)
.L841:
	movzbl	1(%rax), %edx
	testb	%dl, %dl
	je	.L842
	decl	%edx
	incb	6(%rax)
	movb	%dl, 1(%rax)
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L843
.L847:
	movzbl	3(%rax), %esi
	decl	%edx
	movb	%dl, (%rax)
	testb	%sil, %sil
	je	.L844
	addl	%edx, %esi
	movb	$0, 3(%rax)
	movb	%sil, (%rax)
.L844:
	movzbl	(%rax), %edi
	testb	%dil, %dil
	je	.L845
	movzbl	3(%rax), %edx
	movl	%edi, %ebx
	movzbl	%dil, %esi
	movb	%bl, %dh
	movl	%esi, %ebx
	movb	4(%rax), %bh
	addb	%bl, %dl
	addb	%bh, %dh
	movw	%dx, 3(%rax)
.L845:
	movb	$1, (%rax)
	addq	$9, %rax
	movzbl	(%rax), %edx
	testb	%dl, %dl
	jne	.L847
.L843:
	cmpb	$0, -8(%rax)
	leaq	-8(%rax), %rdx
	je	.L848
.L849:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L849
.L848:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L850
.L851:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L851
.L850:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L853
.L852:
	movzbl	2(%rdx), %eax
	testb	%al, %al
	je	.L2279
	addb	%al, 11(%rdx)
	subq	$9, %rdx
	movb	$0, 11(%rdx)
	cmpb	$0, (%rdx)
	jne	.L852
.L853:
	movzbl	2(%rdx), %eax
	testb	%al, %al
	je	.L857
.L2282:
	addb	%al, 11(%rdx)
	cmpb	$0, 8(%rdx)
	leaq	8(%rdx), %rax
	movb	$0, 2(%rdx)
	movb	$1, (%rdx)
	jne	.L859
	movq	(%rsp), %rbx
	.cfi_restore 3
.L840:
	leaq	-9(%rax), %rdx
	movzbl	-9(%rax), %eax
	testb	%al, %al
	je	.L861
.L860:
	cmpb	$0, 1(%rdx)
	je	.L872
	movb	$0, 1(%rdx)
.L872:
	movzbl	4(%rdx), %esi
	decl	%eax
	movb	%al, (%rdx)
	testb	%sil, %sil
	je	.L862
.L868:
	movzbl	1(%rdx), %edi
	decl	%esi
	incl	%eax
	testb	%dil, %dil
	je	.L864
	addb	%dil, -5(%rdx)
	movb	$0, 1(%rdx)
	subb	%dil, %al
	je	.L865
.L864:
	addb	%al, 1(%rdx)
	testb	%sil, %sil
	je	.L867
.L866:
	xorl	%eax, %eax
	jmp	.L868
.L2273:
	.cfi_offset 3, -32
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L815
	movzbl	1(%rdx), %eax
	testb	%al, %al
	jne	.L2280
.L820:
	cmpb	$0, 8(%rdx)
	movb	$1, (%rdx)
	leaq	8(%rdx), %rax
	jne	.L822
	movq	(%rsp), %rbx
	.cfi_remember_state
	.cfi_restore 3
	jmp	.L803
.L842:
	.cfi_restore_state
	leaq	1(%rax), %rdx
	jmp	.L848
.L865:
	.cfi_restore 3
	testb	%sil, %sil
	jne	.L866
.L867:
	movb	$0, (%rdx)
	movb	$0, 4(%rdx)
.L862:
	movzbl	1(%rdx), %eax
	testb	%al, %al
	je	.L869
	addb	%al, 4(%rdx)
	movb	$0, 1(%rdx)
.L869:
	incb	(%rdx)
	subq	$9, %rdx
	movzbl	(%rdx), %eax
	testb	%al, %al
	jne	.L860
.L861:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L874
.L873:
	movzbl	4(%rax), %edx
	testb	%dl, %dl
	je	.L2281
	addb	%dl, -32(%rax)
	addq	$9, %rax
	movb	$0, -5(%rax)
	cmpb	$0, (%rax)
	jne	.L873
.L874:
	cmpb	$0, -9(%rax)
	leaq	-9(%rax), %rdx
	je	.L878
.L879:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L879
.L878:
	addb	$15, 9(%rdx)
	leaq	9(%rdx), %rax
	jne	.L2181
	jmp	.L881
.L882:
	addq	$9, %rax
.L2181:
	cmpb	$0, (%rax)
	jne	.L882
	decb	-9(%rax)
	cmpb	$0, -18(%rax)
	leaq	-18(%rax), %rdx
	je	.L883
.L884:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L884
.L883:
	decb	9(%rdx)
	leaq	9(%rdx), %rax
	jne	.L2181
.L881:
	incb	21(%rax)
	cmpb	$0, 18(%rax)
	leaq	18(%rax), %rdx
	movb	$1, (%rax)
	je	.L886
.L887:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L887
.L886:
	cmpb	$0, 9(%rdx)
	leaq	9(%rdx), %rax
	je	.L889
.L888:
	movzbl	3(%rax), %edx
	testb	%dl, %dl
	je	.L912
	subb	%dl, (%rax)
.L912:
	movzbl	(%rax), %edx
	movb	$1, 3(%rax)
	testb	%dl, %dl
	je	.L893
	movzbl	4(%rax), %esi
	decl	%edx
	movb	$0, 3(%rax)
	movb	%dl, (%rax)
	testb	%sil, %sil
	je	.L2182
	addl	%edx, %esi
	movb	$0, 4(%rax)
	movb	%sil, (%rax)
.L2182:
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L893
.L892:
	decl	%edx
	incb	4(%rax)
	cmpb	$0, -9(%rax)
	movb	%dl, (%rax)
	leaq	-9(%rax), %rdx
	je	.L894
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L895:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L895
.L894:
	cmpb	$0, 9(%rdx)
	movb	$1, 4(%rdx)
	leaq	9(%rdx), %rax
	je	.L896
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L897:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L897
.L896:
	movzbl	(%rax), %edx
	incb	1(%rax)
	testb	%dl, %dl
	jne	.L892
.L893:
	movzbl	4(%rax), %esi
	movl	%ecx, %edx
	movb	$1, 4(%rax)
	subl	%esi, %edx
	testb	%sil, %sil
	cmove	%ecx, %edx
	movb	%dl, (%rax)
	testb	%dl, %dl
	je	.L902
	movzbl	3(%rax), %esi
	decl	%edx
	movb	$0, 4(%rax)
	movb	%dl, (%rax)
	testb	%sil, %sil
	je	.L2183
	addl	%edx, %esi
	movb	$0, 3(%rax)
	movb	%sil, (%rax)
.L2183:
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L902
	decl	%edx
	incb	3(%rax)
	cmpb	$0, -9(%rax)
	movb	%dl, (%rax)
	leaq	-9(%rax), %rdx
	je	.L903
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L904:
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L904
.L903:
	cmpb	$0, 9(%rdx)
	movb	$1, 3(%rdx)
	leaq	9(%rdx), %rax
	je	.L905
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L906:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L906
.L905:
	movb	$1, 1(%rax)
	jmp	.L2183
.L2281:
	addq	$9, %rax
	cmpb	$0, (%rax)
	jne	.L873
	jmp	.L874
.L2279:
	.cfi_offset 3, -32
	subq	$9, %rdx
	cmpb	$0, (%rdx)
	jne	.L852
	movzbl	2(%rdx), %eax
	testb	%al, %al
	jne	.L2282
.L857:
	cmpb	$0, 8(%rdx)
	movb	$1, (%rdx)
	leaq	8(%rdx), %rax
	jne	.L859
	movq	(%rsp), %rbx
	.cfi_restore 3
	jmp	.L840
.L2207:
	movb	$0, tape(%rip)
	jmp	.L3
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.local	tape
	.comm	tape,30000,32
	.section	.rodata.cst2,"aM",@progbits,2
	.align 2
.LC0:
	.byte	6
	.byte	-3
	.ident	"GCC: (GNU) 16.1.1 20260625"
	.section	.note.GNU-stack,"",@progbits
