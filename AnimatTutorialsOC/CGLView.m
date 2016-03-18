//
//  CGLView.m
//  AnimatTutorialsOC
//
//  Created by JiaLi on 16/3/18.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import "CGLView.h"
const int width = 1024, height = 1024;

#define EPSILON 0.001f
#define EPS2  EPSILON*EPSILON

size_t total_points=0;
float timeStep =  1/60.0f;
float currentTime = 0;
float accumulator = timeStep;
int selected_index = -1;


struct Tetrahedron {
    int indices[4];			//indices
    float volume;			//volume
    float plastic[6];		//plasticity values
    glm::vec3 e1, e2, e3;	//edges
    glm::mat3 Re;			//Rotational warp of tetrahedron.
    glm::mat3 Ke[4][4];		//Stiffness element matrix
    glm::vec3 B[4];			//Jacobian of shapefunctions; B=SN =[d/dx  0     0 ][wn 0  0]
    //                                  [0    d/dy   0 ][0 wn  0]
    //									[0     0   d/dz][0  0 wn]
    //									[d/dy d/dx   0 ]
    //									[d/dz  0   d/dx]
    //									[0    d/dz d/dy]
};

vector<Tetrahedron> tetrahedra;

float nu = 0.33f;			//Poisson ratio
float Y = 500000.0f;		//Young modulus
float density =1000.0f;
float creep = 0.20f;
float yield = 0.04f;
float mass_damping=1.0f;
float m_max = 0.2f;

float d15 = Y / (1.0f + nu) / (1.0f - 2 * nu);
float d16 = (1.0f - nu) * d15;
float d17 = nu * d15;
float d18 = Y / 2 / (1.0f + nu);

glm::vec3 D(d16, d17, d18); //Isotropic elasticity matrix D

int oldX=0, oldY=0;
float rX=15, rY=0;
int state =1 ;
float dist=-2.5f;
const int GRID_SIZE=10;


glm::vec3 gravity=glm::vec3(0.0f,-9.81f,0.0f);


GLint viewport[4];
GLdouble MV[16];
GLdouble P[16];

glm::vec3 Up=glm::vec3(0,1,0), Right, viewDir;

LARGE_INTEGER frequency;        // ticks per second
LARGE_INTEGER t1, t2;           // ticks
float frameTimeQP=0;
float frameTime =0 ;

float startTime =0, fps=0;
int totalFrames=0;


char info[MAX_PATH]={0};

int total_tetrahedra =0;

vector<glm::vec3> Xi;		//Model coordinates
vector<glm::vec3> X;		//Current coordinates
vector<glm::vec3> V;		//Velocity
vector<float> mass;			//Mass matrix
vector<glm::vec3> F;		//Force
vector<bool> IsFixed;		//Fixed point
glm::mat3 I=glm::mat3(1);	//3x3 identity matrix

typedef map<int, glm::mat3> matrix_map;
vector<matrix_map> K_row;
vector<matrix_map> A_row;
typedef matrix_map::iterator matrix_iterator;
vector<glm::vec3> F0;
vector<glm::vec3> b;

//For Conjugate Gradient
vector<glm::vec3> residual;
vector<glm::vec3> prev;
vector<glm::vec3> update;

float tiny      = 1e-010f;       // TODO: Should be user controllable
float tolerence = 0.001f;
int i_max = 20;

bool bUseStiffnessWarping = true;
void UpdateOrientation();
void StepPhysics(float dt);
@implementation CGLView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
