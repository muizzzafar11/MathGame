int state;
//for the buttons 
//the number of boxes
int numBox = 11;
//the position of the box
PVector [] pos = new PVector [numBox];
//declaring the variables for the box
int seperation, boxWidth, boxLength;
//for the digits in the boxes
int [] numbers = new int [] {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
//random numbers for the questions
int number1;
int number2;
//the answer fo the question
int answer;
//array for the question
//testing
int [] answers;
int lengt;
//int nooo;
//for the timer
int last = 0;
int m = 0;
//for the score
int score;
//for the turn
int turns;
//for the timer on the end game
int timer = 10;
void setup() {
  //for the size
  size(1000, 900); 
  frameRate(105);
  //for the rect in the center
  rectMode(CENTER);
  //for the seperation
  seperation = width/numBox;//dividing the width of the screen into 11 equakl parts
  //for the width of the boc=xes
  boxWidth = seperation;//the width of the boxes
  boxLength = 100;//the length of the boxes
  //for loop for the position of the boxes
  for (int i = 0; i < pos.length; i++) {
    pos[i] = new PVector(i*seperation, 795);//the position of the boxes
  }
  number1 = (int) random(0, 6);//the first element of the answers array
  number2 = (int) random(0, 6);//the second eleent of the answers array
  //answer = number1 + number2;
  answers = new int [] {number1, number2};//declaring the answers array
  answer = number1+number2;//the initial answer is equal to the first and the second element of the answers array
  lengt = 900;//the length of the line
  score = 0 ;//for the initial score
  turns = 0 ; //for changinf=g teh turns and after 5 turns the game ends
  state = 0 ;//for teh states if the game
}
void draw() {

  states();
}
void preGame() {
  background(0);
  textAlign(CENTER, CENTER);
  text("PRESS ANY KEY TO CONTINUE", width/2, height/2);
  if (keyPressed) {
    state = 1;
  }
}
void game() {
  background(200);
  text("Score : "+score, width/2, 40);
  for (int i = 0; i<pos.length; i++) {
    //println for the question
    text(number1+" + "+number2+"  =  ?", 200, 200);
    fill(255);
    //the hit detection for the rectangles
    if (mouseX>(pos[i].x)&&mouseX<(pos[i].x)+boxWidth&&mouseY>pos[i].y-(boxLength/2)&&mouseY<pos[i].y+(boxLength/2)&&mousePressed) {
      if (numbers[i] == answer) {

        score ++; 
        turns ++;  
        {
          //sets the frame rate of the text to 5 so that the correct ans text could be displayed
          frameRate(5);
          text("corrcet answer", 200, 300);
        }
        number1 = number1+(int) random(0, 6);//replacing the values of index 0 with another number
        number2 = number2+ (int) random(0, 6);//replacing the values of index 1 with another number
        if (number1 > 5) {
          number1 = 5;//so that the numbers donodt increase more than 5
          number1 =  number1 -(int) random(0, 6);//and u subtract the a random 0 - 6 number from the number which hasn't exceeded 5
        }
        if (number2 > 5 ) {
          number2 = 5;//same as above
          number2 =  number2 -(int) random(0, 6);//same as above
        }//end for the testing part
        answer = number1+number2;//if the answer of the user is correct then change the answer to the new numbers answer
        //score ++;
        //score-=1;
      }//end for the correct statement

      else if (numbers[i] != answer) {

        text("WRONG ANSWER", 200, 400);
      }
      fill(0, 255, 50);
    }
    if (turns >= 5) {
      state = 2;
    }
    strokeWeight(1);
    rect(50+pos[i].x, pos[i].y, boxWidth, boxLength, 25);
    fill(0);
    textSize(30);
    textAlign(CENTER, CENTER);
    text(numbers[i], pos[i].x+50, pos[i].y);
  }
}

void endGame() {
  //the timer and the time is still a bit messed up 
  background(0);
  turns = 0 ;
  score = 0;
  timer--;
  textAlign(CENTER,CENTER);
  fill(255);
  textSize(30);
  text("press ANY KEY to return to the game",width/2,300);
  text("or u will return to the main menu in :"+timer+"s",width/2,400);
  if (keyPressed) {
    state = 1;
  }
  //returns them to the main menu
  else{
   m = millis()-last;
  if (millis()>10000) {
    last = millis();
    state = 0 ;
  }

  }
}
void states() {
  if (state == 0) {
    preGame();
  }
  if (state == 1 ) {
    game();
  }
  if (state == 2) {
    endGame();
  }
}
////for the timer
//  //this timer delays something 
//  m = millis()-last;
//  //this first displays the message and then after 5 sec it turns it removes it and the timer resets due to the secon dif statement 
//  if (millis() < 5000) {
//    //last = millis();
//    //background(0);
//    text("welcome to the game", width/2, height/2);
//    //put whichever function u wnat to put in it
//  }
//  if (millis()>5000) {
//    last = millis();
//  }
