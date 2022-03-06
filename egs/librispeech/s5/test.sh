function main()
{    
    s=""
    n=0
   [[ $(expr $1 % 3) == 0  ]] &&  { s+="Pling"; }  || let ++n echo $n;
   [[ $(expr $1 % 5) == 0  ]] &&  { s+="Plang"; }  || let ++n  echo $n;
   [[ $(expr $1 % 7) == 0  ]] &&  { s+="Plang"; }  || let ++n  echo $n;

    [[ $n -eq 3 ]] && { echo $1; }  || echo $s;
       



}
#
#   # call main with all of the positional arguments
main "$@"