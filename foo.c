#include <stdio.h>

int main() {
    char str[1000];
    int i = 0;
    char ch;
    do {
        ch = fgetc(stdin);
        str[i++] = ch;
    } while(ch != '\n');
    str[i-1] = '\0';

    int n = i;
    int isword = 0;
    int l, r;
    for (i = 0; i < n; ++i) {
        if (isword == 1) {
            if (str[i] < 65) {
                r = i - 1;
                isword = 0;
                for (int j = l, t = r; j < t; ++j, --t) {
                    ch = str[j];
                    str[j] = str[t];
                    str[t] = ch;
                }
            }
        } else {
            if (str[i] > 64) {
                l = i;
                isword = 1;
            }
        }
    }
    printf("%s", str);
    return 0;
}
