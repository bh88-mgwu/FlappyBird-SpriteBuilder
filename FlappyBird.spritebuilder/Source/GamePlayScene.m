#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    character = (Character*)[CCBReader load:@"Character"];
    [physicsNode addChild:character];
    
    [self addObstacle];
    timeSinceObstacle = 0.0f;
}

-(void)update:(CCTime)delta
{
    // put update code here
    // thi swill be run every frame
    // delta is the time that has elapsed sinc the last time it was run
    timeSinceObstacle += delta;
    
    // Check to see if two seconds have passed
    if (timeSinceObstacle > 1.0f) {
        // Add a new obstacle
        [self addObstacle];
        
        // Then reset the timer.
        timeSinceObstacle = 0.0f;
    }
}

// put new methods here
-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    // this will get called every time the player touches the screen
    [character flap];
}

@end
