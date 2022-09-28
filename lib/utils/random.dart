import 'dart:math';

int randomColor(){
    Random rnd;
    int min = 0;
    int max = 10;
    rnd = new Random();
    int r = min + rnd.nextInt(max - min);
    return r;
}