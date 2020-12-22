%{

int comma = 0;  /* to check empty entries, rendered by consecutive commas */

%}

%%

[a-zA-Z0-9]+		{printf("<td> "); ECHO; comma = 0;}
","             {if (comma) { printf("<td> </td>"); } else { printf("</td>"); }
                 comma = 1;
                }
\n              {printf("</td> </tr> \n <tr>"); comma = 0;}

%%
int main() {
  printf("<html><body><table border=\"\" cellpadding=\"3\" cellspacing=\"0\"><tbody> \n <tr>");
  yylex();
  printf("</tr>\n</tbody></table>\n");
  printf("</body></html>\n");
  return 0;
}