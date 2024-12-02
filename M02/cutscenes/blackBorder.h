
//{{BLOCK(blackBorder)

//======================================================================
//
//	blackBorder, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 2 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 64 + 2048 = 2624
//
//	Time-stamp: 2024-11-20, 00:13:24
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BLACKBORDER_H
#define GRIT_BLACKBORDER_H

#define blackBorderTilesLen 64
extern const unsigned short blackBorderTiles[32];

#define blackBorderMapLen 2048
extern const unsigned short blackBorderMap[1024];

#define blackBorderPalLen 512
extern const unsigned short blackBorderPal[256];

#endif // GRIT_BLACKBORDER_H

//}}BLOCK(blackBorder)
