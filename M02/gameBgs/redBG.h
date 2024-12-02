
//{{BLOCK(redBG)

//======================================================================
//
//	redBG, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 432 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 13824 + 2048 = 16384
//
//	Time-stamp: 2024-11-14, 04:10:00
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_REDBG_H
#define GRIT_REDBG_H

#define redBGTilesLen 13824
extern const unsigned short redBGTiles[6912];

#define redBGMapLen 2048
extern const unsigned short redBGMap[1024];

#define redBGPalLen 512
extern const unsigned short redBGPal[256];

#endif // GRIT_REDBG_H

//}}BLOCK(redBG)
