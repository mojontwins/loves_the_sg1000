// SG-1000 MK1 v0.2
// Copyleft Mojon Twins 2013, 2015, 2017, 2018

// Add support for custom hotspots types here. Support for each
// new type of hotspot should be coded in a 'case', like this:

/*
	case HOTSPOT_TYPE_MY_OWN:
		gp_gen = SFX_OBJECT;
		// if gp_gen needs channel 3 or channels 2+3
		// do rdm = 2 or rdm = 3 as fit.
		// do stuff
		break;
*/

// If rda != 0, the engine will play the sound in rda when getting
// the hotspot.

// hrt contains the hotspot type, in case you need it.
