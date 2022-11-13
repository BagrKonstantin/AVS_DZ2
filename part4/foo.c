#include <stdio.h>

char str[1000];

int reverse(int l, int r) {
    char ch;
    for (int j = l, t = r; j < t; ++j, --t) {
        ch = str[j];
        str[j] = str[t];
        str[t] = ch;
    }
    return 0;
}

int main(int argc, char * argv[]) {
    FILE *input = fopen(argv[1], "r");
    FILE *output = fopen(argv[2], "w");
    int i = 0;
    char ch;
    do {
        ch = fgetc(input);
        str[i++] = ch;
    } while (ch != -1);
    str[i - 1] = '\0';

    int n = i;
    int isword = 0;
    int l;
    for (i = 0; i < n; ++i) {
        if (isword == 1) {
            if (str[i] < 'A' || str[i] > 'z' || (str[i] > 'Z' && str[i] < 'a')) {
                isword = reverse(l, i - 1);
            }
        } else {
            if (str[i] >= 'A' && str[i] <= 'Z' || str[i] >= 'a' && str[i] <= 'z') {
                l = i;
                isword = 1;
            }
        }
    }
    printf(output, "%c", '\n');
    printf(output, "%s", str);
    fclose(input);
    fclose(output);
    return 0;
}
