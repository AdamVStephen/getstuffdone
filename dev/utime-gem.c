#include <stdio.h>
#include <stdlib.h>

unsigned long tms;
unsigned long tms_prev;
//unsigned long uts;
static float uts;
unsigned long uts_cur;

unsigned long utdd;
static unsigned long utdd_cum;
unsigned long uthh;
static unsigned long uthh_cum;
unsigned long utmm;
static unsigned long utmm_cum;

void uptime(unsigned long tms) {
unsigned long elapsed;
unsigned long residual;
unsigned long recombined;
	if (tms > tms_prev) { 
	uts += (tms - tms_prev)/1000.;
} else {
	uts += (tms_prev - tms)/1000.;
}
	elapsed = (unsigned long) uts;
	utdd = (elapsed/86400);
	residual = elapsed - (utdd*86400);
	uthh = (residual/3600);
	residual = residual - (uthh*3600);
	utmm = (residual/60);

	recombined =  (utdd*86400) + (uthh * 3600) + (utmm * 60);

printf("Time %f s %ld : %ld:%ld:%ld\n", uts,elapsed, utdd, uthh, utmm);
printf("Recombined time : %ld\n", recombined);
tms_prev = tms;
}

int main(int argc, char * argv[]) {
int d,h,m;
tms = 0;
unsigned long delta_d;
unsigned long delta_h;
unsigned long delta_m;
for (d = 1; d<101; d++) {
	delta_d = 86400000;
	tms += delta_d;
	for (h = 10; h < 15; h++) {
		delta_h = h*3600*1000;
		for (m = 20; m < 60; m+=20) {
			delta_m = m*60*1000;
			printf("%ld %d %d %d\n", tms+delta_h+delta_m, d, h, m);
			uptime(tms+delta_h+delta_m);
		}
	}
}
}

