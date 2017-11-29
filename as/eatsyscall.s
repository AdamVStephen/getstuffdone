.data

eatmsg:
    .ascii "Eat at Joe's!\n"
    eatlen = . - eatmsg

.text

.global _start

_start:
    mov $1, %eax        # 'write' syscall
    mov $1, %edi        # write to stdout (fd 1)
    mov $eatmsg, %rsi   # address of string to write
    mov $eatlen, %edx   # length of string to write
    syscall

    mov $60, %eax       # 'exit' syscall
    mov $0, %edi        # return code 0
    syscall
