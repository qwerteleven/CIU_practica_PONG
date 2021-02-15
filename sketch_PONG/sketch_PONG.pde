
import processing.sound.*;
SoundFile file_score;
SoundFile file_player;

//object definitions
Player player1;
Player player2;
Ball ball;

// Gap table game
int low_bound = 30;
int up_bound  = 100;

// mask active keys
boolean[] moves = {false, false, false, false};

//////////////////////////////////

public class Ball {
  
  // position
  private int x;
  private int y;
  
  // movement vector
  private int x_v = 0;
  private int y_v = 0;
  
  // ball size
  private int inch = 5;
  
  // bounce increment
  private int alpha = 1;
  
  public Ball() {
    x = width / 2;
    y = height / 2;
  }
  
  void check_moves() {
    int[] pos_p1 = player1.get_position();
    int[] pos_p2 = player2.get_position();
    
    if(x > pos_p1[2] && x + x_v -3 < pos_p1[2] && pos_p1[0] < y - inch && pos_p1[1] > y - inch){ 
      
      if (x_v > 0){
        x_v = x_v + alpha;
      } else {
        x_v = x_v - alpha;
      }
      
      x_v = -x_v;
      file_player.play();
    }
    
    if(x < pos_p2[2] && x + x_v +3 > pos_p2[2] && pos_p2[0] < y + inch && pos_p2[1] > y + inch){
      
      if (x_v > 0){
        x_v = x_v + alpha;
      } else {
        x_v = x_v - alpha;
      }
      
      x_v = -x_v;
      file_player.play();
    }
    
    if(y + y_v - inch < up_bound || y + y_v + inch > height - low_bound) y_v = -y_v;
    
    if(x + x_v + inch*5 < pos_p1[2] && !(pos_p1[0] < y - inch && pos_p1[1] > y - inch)) {
      player2.increment_score();
      file_score.play();
      reset();
    }
    
    if(x + x_v - inch*5 > pos_p2[2] && !(pos_p2[0] < y + inch && pos_p2[1] > y + inch)) {
      player1.increment_score();
      file_score.play();
      reset();
    }
  
  }
  
  void move() {
    x = x + x_v;
    y = y + y_v;
  }
  
  void display() {
    
    move();
    rect(x - inch, y - inch, inch * 2, inch * 2);
  }
  
  void reset() {
    
    x = width / 2;
    y = height / 2;
    x_v = int(random(-4, -1) * (random(-1, 1) > 0 ? 1 : -1));
    y_v = int(random(-4, -1) * (random(-1, 1) > 0 ? 1 : -1));
  
  }
  
}


//////////////////////////////


public class Player {
  
  // ends bar
  private int y_up;
  private int y_down;
  
  // thickness bar
  private final int thick = 2;
  
  // lenght bar
  private final int inch = 20;
  
  // sep border
  private int x;
  
  // speed bar
  private int speed_move = 5;
  
  private int score = 0;
  
  Player (int y, int x) {
    
    y_up   = y - inch;
    y_down = y + inch;
    this.x = x;
  }
  
  void display() {
    
    rect(x, y_up, thick, inch * 2);
  }
  
  void increment_score() {
    
    score = score + 1;
  }
  
  int get_score() {
    
    return score;
  }
  
  void update_position(int increment) {
    
    y_up = y_up - increment;
    y_down = y_down - increment;
  }
  
  
  void move(int direction) {
    
    int increment = speed_move * direction;
    if (y_up - increment < up_bound) return;
    if (y_down - increment > height - low_bound) return;
   
    update_position(increment);
  }
  
  int[] color_player() {
    return new int[] {255, 0, 0};
  }
  
  int[] get_position() {
    
    return new int[] {y_up, y_down, x};
  }

}


void table_top() {
  
  background(0);
  stroke(0, 0, 255);
  line(width/2, 0, width/2, height);
  stroke(255, 0, 0);
  line(0, up_bound, width, up_bound);
  line(0, height - low_bound, width, height - low_bound);
  
  player1.display();
  player2.display();
  textSize(24);
  text(player1.get_score(), width / 2 - 50, 50);
  text(player2.get_score(), width / 2 + 50, 50);
  text("player 1", width / 2 - 250, 50);
  text("player 2", width / 2 + 150, 50);
  
  ball.display();
}


   
void setup() {
  size(640, 640);
  noStroke();
  frameRate(60);
  
  file_score = new SoundFile(this, "PING.mp3");
  file_player = new SoundFile(this, "PONG.mp3");
  player1 = new Player(height/2, 100);
  player2 = new Player(height/2, width - 100);
  ball = new Ball();

}

void move_objects () {
  
  if (moves[0])player1.move(1);
  if (moves[1])player1.move(-1);
  if (moves[2])player2.move(1);
  if (moves[3])player2.move(-1);
  
  ball.check_moves();
}



void draw() {
  move_objects();
  table_top();
}


void set_movement(int k, boolean b) {
  switch (k) {
  case +'W':
    moves[0] = b;
    break;
  case +'S':
    moves[1] = b;
    break;
    
  case UP:
    moves[2] = b;
    break;
  case DOWN:
    moves[3] = b;
    break;

  case +' ':
    conti();
    break;
  
  case +'R':
    reset();
    break;
  }
}

void reset() {
  setup();
  ball.reset();
}

void conti() {
  ball.reset();
}

void keyPressed() {
  set_movement(keyCode, true);
  
}

void keyReleased() {
  set_movement(keyCode, false);
  
}
