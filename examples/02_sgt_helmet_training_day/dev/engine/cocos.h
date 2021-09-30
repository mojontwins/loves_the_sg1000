// SG-1000 MK1 v0.4
// Copyleft Mojon Twins 2013, 2015, 2017-2019

// Simple multidirectional fixed point cocos

void cocos_init (void);

#ifdef COCOS_ENABLE_AIMED
	void cocos_shoot_aimed (void);
#endif

#ifdef COCOS_ENABLE_LINEAR
	void cocos_shoot_linear (void);
#endif

void cocos_destroy (void);
void cocos_do (void);
