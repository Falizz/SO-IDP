    10b8:       48 8d 3d ca 00 00 00    lea    0xca(%rip),%rdi        # 1189 <main>
    10bf:       ff 15 13 2f 00 00       call   *0x2f13(%rip)        # 3fd8 <__libc_start_main@GLIBC_2.34>
    10c5:       f4                      hlt
    10c6:       66 2e 0f 1f 84 00 00    cs nopw 0x0(%rax,%rax,1)
    10cd:       00 00 00

00000000000010d0 <deregister_tm_clones>:
    10d0:       48 8d 3d 39 2f 00 00    lea    0x2f39(%rip),%rdi        # 4010 <__TMC_END__>
    10d7:       48 8d 05 32 2f 00 00    lea    0x2f32(%rip),%rax        # 4010 <__TMC_END__>
    10de:       48 39 f8                cmp    %rdi,%rax
    10e1:       74 15                   je     10f8 <deregister_tm_clones+0x28>
    10e3:       48 8b 05 f6 2e 00 00    mov    0x2ef6(%rip),%rax        # 3fe0 <_ITM_deregisterTMCloneTable@Base>
    10ea:       48 85 c0                test   %rax,%rax
    10ed:       74 09                   je     10f8 <deregister_tm_clones+0x28>
    10ef:       ff e0                   jmp    *%rax
    10f1:       0f 1f 80 00 00 00 00    nopl   0x0(%rax)
    10f8:       c3                      ret
    10f9:       0f 1f 80 00 00 00 00    nopl   0x0(%rax)

0000000000001100 <register_tm_clones>:
    1100:       48 8d 3d 09 2f 00 00    lea    0x2f09(%rip),%rdi        # 4010 <__TMC_END__>
    1107:       48 8d 35 02 2f 00 00    lea    0x2f02(%rip),%rsi        # 4010 <__TMC_END__>
    110e:       48 29 fe                sub    %rdi,%rsi
    1111:       48 89 f0                mov    %rsi,%rax
    1114:       48 c1 ee 3f             shr    $0x3f,%rsi
    1118:       48 c1 f8 03             sar    $0x3,%rax
    111c:       48 01 c6                add    %rax,%rsi
    111f:       48 d1 fe                sar    $1,%rsi
    1122:       74 14                   je     1138 <register_tm_clones+0x38>
    1124:       48 8b 05 c5 2e 00 00    mov    0x2ec5(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable@Base>
    112b:       48 85 c0                test   %rax,%rax
    112e:       74 08                   je     1138 <register_tm_clones+0x38>
    1130:       ff e0                   jmp    *%rax
    1132:       66 0f 1f 44 00 00       nopw   0x0(%rax,%rax,1)
    1138:       c3                      ret
    1139:       0f 1f 80 00 00 00 00    nopl   0x0(%rax)

0000000000001140 <__do_global_dtors_aux>:
    1140:       f3 0f 1e fa             endbr64
    1144:       80 3d c5 2e 00 00 00    cmpb   $0x0,0x2ec5(%rip)        # 4010 <__TMC_END__>
    114b:       75 2b                   jne    1178 <__do_global_dtors_aux+0x38>
    114d:       55                      push   %rbp
    114e:       48 83 3d a2 2e 00 00    cmpq   $0x0,0x2ea2(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1155:       00
    1156:       48 89 e5                mov    %rsp,%rbp
    1159:       74 0c                   je     1167 <__do_global_dtors_aux+0x27>
    115b:       48 8b 3d a6 2e 00 00    mov    0x2ea6(%rip),%rdi        # 4008 <__dso_handle>
    1162:       e8 f9 fe ff ff          call   1060 <__cxa_finalize@plt>
    1167:       e8 64 ff ff ff          call   10d0 <deregister_tm_clones>
    116c:       c6 05 9d 2e 00 00 01    movb   $0x1,0x2e9d(%rip)        # 4010 <__TMC_END__>
    1173:       5d                      pop    %rbp
    1174:       c3                      ret
    1175:       0f 1f 00                nopl   (%rax)
    1178:       c3                      ret
    1179:       0f 1f 80 00 00 00 00    nopl   0x0(%rax)

0000000000001180 <frame_dummy>:
    1180:       f3 0f 1e fa             endbr64
    1184:       e9 77 ff ff ff          jmp    1100 <register_tm_clones>

0000000000001189 <main>:
    1189:       f3 0f 1e fa             endbr64
    118d:       55                      push   %rbp
    118e:       48 89 e5                mov    %rsp,%rbp
    1191:       48 83 ec 30             sub    $0x30,%rsp
    1195:       89 7d ec                mov    %edi,-0x14(%rbp)
    1198:       48 89 75 e0             mov    %rsi,-0x20(%rbp)
    119c:       48 89 55 d8             mov    %rdx,-0x28(%rbp)
    11a0:       bf 89 04 00 00          mov    $0x489,%edi
    11a5:       e8 e6 fe ff ff          call   1090 <malloc@plt>
    11aa:       48 89 45 f8             mov    %rax,-0x8(%rbp)
    11ae:       48 8b 45 f8             mov    -0x8(%rbp),%rax
    11b2:       48 89 c6                mov    %rax,%rsi
    11b5:       48 8d 05 48 0e 00 00    lea    0xe48(%rip),%rax        # 2004 <_IO_stdin_used+0x4>
    11bc:       48 89 c7                mov    %rax,%rdi
    11bf:       b8 00 00 00 00          mov    $0x0,%eax
    11c4:       e8 b7 fe ff ff          call   1080 <printf@plt>
    11c9:       48 8b 45 f8             mov    -0x8(%rbp),%rax
    11cd:       48 89 c7                mov    %rax,%rdi
    11d0:       e8 9b fe ff ff          call   1070 <free@plt>
    11d5:       b8 00 00 00 00          mov    $0x0,%eax
    11da:       c9                      leave
    11db:       c3                      ret

Disassembly of section .fini:

00000000000011dc <_fini>:
    11dc:       f3 0f 1e fa             endbr64
    11e0:       48 83 ec 08             sub    $0x8,%rsp
    11e4:       48 83 c4 08             add    $0x8,%rsp
    11e8:       c3                      ret