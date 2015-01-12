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
    //this will be run every frame
    //delta is the time since this update method was last run
    //Increment the time since the last obstacle was added
    timeSinceObstacle += delta;
    
    //Check if two seconds have passed since the last obstacle
    if(timeSinceObstacle>2.0f)
    {
    //add a new obstacle
        [self addObstacle];
        
    //reset time since obstacle
        timeSinceObstacle = 0.0f;
    }
    
    
    // put update code here
}

// put new methods here
-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    //this will get called every time the player touches the screen
    [character flap];
}

@end
