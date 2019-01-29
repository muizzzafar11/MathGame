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
int score;
int lengt;
int nooo;
//for the timer
int last = 0;
int m = 0;
void setup() {
  size(1000, 900); 
  rectMode(CENTER);
  seperation = width/numBox;//dividing the width of the screen into 11 equakl parts
  boxWidth = seperation;//the width of the boxes
  boxLength = 100;//the length of the boxes
  for (int i = 0; i < pos.length; i++) {
    pos[i] = new PVector(i*seperation, 795);//the position of the boxes
  }
  number1 = (int) random(0, 6);//the first element of the answers array
  number2 = (int) random(0, 6);//the second eleent of the answers array
  //answer = number1 + number2;
  answers = new int [] {number1, number2};//declaring the answers array
  answer = number1+number2;//the initial answer is equal to the first and the second element of the answers array
  lengt = 900;
}
void draw() {
  // 
  background(200);
  strokeWeight(20);

  line(100, 70, lengt, 70);
  //use a timer here'


  lengt -- ;

  if (lengt < 100) {
    lengt = 100;
    //set the state == 1;//or the endgame state 
    println("die die die");
  }
  text("Score : "+score, width/2, 40);
  for (int i = 0; i<pos.length; i++) {
    //println for the question
    text(number1+" + "+number2+"  =  ?", 200, 200);
    fill(255);
    //the hit detection for the rectangles
    if (mouseX>(pos[i].x)&&mouseX<(pos[i].x)+boxWidth&&mouseY>pos[i].y-(boxLength/2)&&mouseY<pos[i].y+(boxLength/2) &&mousePressed) {
      if (numbers[i] == answer) {
        text("CORRECT ANSWER", 200, 400);

        //testing for the question number
        number1 = number1+(int) random(0, 6);//replacing the values of index 0 with another number
        number2 = number2+ (int) random(0, 6);//replacing the values of index 1 with another number
        if (number1 > 5) {
          number1 = 5;//so that the numbers donot increase more than 5
          number1 =  number1 -(int) random(0, 6);//and u subtract the a random 0 - 6 number from the number which hasn't exceeded 5
        }
        if (number2 > 5 ) {
          number2 = 5;//same as above
          number2 =  number2 -(int) random(0, 6);//same as above
        }//end for the testing part
        answer = number1+number2;//if the answer of the user is correct then change the answer to the new numbers answer
        score ++;
      }//end for the correct statement

      else if (numbers[i] != answer) {

        text("WRONG ANSWER", 200, 400);
      }
      fill(0, 255, 50);
      //text(answers[i]+" + "+answers[i]+"  =  ?", 200, 200);
    }


    strokeWeight(1);
    rect(50+pos[i].x, pos[i].y, boxWidth, boxLength, 25);
    fill(0);
    textSize(30);
    textAlign(CENTER, CENTER);
    text(numbers[i], pos[i].x+50, pos[i].y);
  }

  //for the timer
  m = millis()-last;
  if (millis() > 11000) {
    last = millis();
    //put whichever function u wnat to put in it
  }
}

//for the peasy cam
////put these above the setup
//importing the peasy cam
//import peasy.*;
//declaring the peasy cam
//PeasyCam cam;
/**************************************************////put this in the setup
//cam = new PeasyCam(this, midPoint.x, midPoint.y, 0, 800);  
// cam.rotateX(0.0);
// cam.rotateY(0.0);
// cam.rotateZ(0.0);


//for the music 
//minim
//Minim minim;
//AudioPlayer backgroundMusic;
//void SoundSetup() {
//  minim = new Minim(this);
//  backgroundMusic = minim.loadFile("abc.mp3");//same as above//the background music
//}

//void music() {
//  //sound for the background music
//  backgroundMusic.play();
//  //compulsary if statement 
//  if (backgroundMusic.position() == backgroundMusic.length()) {
//    backgroundMusic.rewind();
//  }
////telling thet if the state == 1 the u can pause or play the music
//  if (state == 1) {
//    if (key == '9') {
//      backgroundMusic.pause();
//    } else if (key == '0') {
//      backgroundMusic.play();
//    }
//  }
//}

/****************************************************************************************/
//for loading an image
//int numberOfObjects = 25;

//PImage[] myImageArray = new PImage[numberOfObjects];
//myFloatArray[] = new float[numberOfObjects];

//for (int i=0; i<numberOfObjects; i++){
//  myImageArray[i] = loadImage( "fileName" + i + ".png");
//  myFloatArray[i] = random(0, 1234);
//}
