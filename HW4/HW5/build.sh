happy hap.y -o hap.hs
ghc hap.hs -o hap
./hap < testfoo.qk > myTerrible.c

cat start.c myTerrible.c closingBrace > augmentedAwful.c

gcc -g -O -c Builtins.c 2> donotcare
gcc augmentedAwful.c Builtins.c -o yeaLikeThisIsGoingToRunCorrectly 2> donotcare2
./yeaLikeThisIsGoingToRunCorrectly


