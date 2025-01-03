
//{{BLOCK(winScreen)

//======================================================================
//
//	winScreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 55 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1760 + 2048 = 4320
//
//	Time-stamp: 2024-11-27, 23:25:11
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

const unsigned short winScreenTiles[880] __attribute__((aligned(4)))=
{
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0xE000,0x0000,0xE000,
	0x0E00,0x0000,0x0E00,0x0000,0x00E0,0x0000,0x00E0,0x0000,
	0x000E,0x0000,0x000E,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x000E,0x0000,0x000E,0x0000,0x000E,0x0000,0x000E,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0xE000,
	0x0000,0x0E00,0x0000,0x00E0,0x0000,0x000E,0xE000,0x0000,
	0xE000,0x0000,0x0E00,0x0000,0x00E0,0x0000,0x00E0,0x0000,
	0x000E,0x0000,0x000E,0x0000,0x000E,0x0000,0x00E0,0x0000,
	0x00E0,0x0000,0x00E0,0x0000,0x00E0,0x0000,0x00E0,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0xE000,0x0000,0xE000,
	0x0000,0xE000,0x0000,0x0E00,0x0000,0x0E00,0x0000,0x0E00,

	0x00E0,0x0000,0x0EE0,0x0000,0x0E00,0x0000,0x0E00,0x0000,
	0x0E00,0x0000,0x0E00,0x0000,0x0E00,0x0000,0x0E00,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x00E0,0x0000,0x00E0,0x0000,0x00E0,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0xEE00,
	0x0000,0x00E0,0x0000,0x00E0,0x0000,0x000E,0x0000,0x000E,
	0xE000,0x0000,0xE000,0x0000,0xE000,0x0000,0xE000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x00E0,
	0x0000,0x0000,0x0000,0x0000,0x000E,0x0000,0x000E,0x0000,
	0x000E,0x0000,0x000E,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x000E,0x0000,0x000E,0x0000,0x000E,0xE000,0x000E,0x0EEE,
	0xE00E,0x0000,0xEE0E,0x0000,0x0EEE,0x0000,0x00EE,0x0000,
	0xEE00,0x00EE,0x0EEE,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0xEE00,0x0000,0xE000,0x000E,0x0000,0x000E,0x0000,0x000E,
	0x0000,0x000E,0x0000,0x000E,0x0000,0x000E,0x0000,0x00EE,
	0x0E00,0x0000,0x0E00,0x0000,0x0E00,0x0000,0x0E00,0x0000,
	0x0E00,0x0000,0x0E00,0x0000,0x0E00,0x0000,0x0E00,0x0000,
	0x0000,0x00E0,0x0000,0x00E0,0x0000,0x00E0,0x0000,0x00EE,
	0x0000,0x00EE,0xE000,0x00E0,0xE000,0x0E00,0x0E00,0x0E00,
	0x0000,0x0000,0x0000,0x0000,0x0000,0xE000,0x0000,0xE000,
	0x0000,0xE000,0x0000,0xE000,0x0000,0xE000,0x0000,0x0E00,

	0x000E,0x0000,0x000E,0x0000,0x000E,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0xE000,0x0000,0xE000,0x0000,0xE000,0x0000,0xE000,
	0x0000,0xE000,0x0000,0xE000,0x0000,0xE000,0x0000,0xE000,
	0x00EE,0x0000,0x00EE,0x0000,0x000E,0x0000,0x000E,0x0000,
	0x000E,0x0000,0x000E,0x0000,0x000E,0x0000,0x000E,0x0000,
	0xE000,0x0000,0xE000,0x000E,0x0000,0x000E,0x0000,0x00EE,
	0x0000,0xEE00,0x0000,0xE000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x00EE,0x0000,0xEE00,0x000E,0x0000,0xEEE0,
	0x0000,0x0000,0x0000,0x0000,0x0000,0xE000,0x0000,0xEE00,
	0x0000,0x00EE,0xEEE0,0x000E,0x00EE,0x0000,0x0000,0x0000,
	0x0E00,0x0E00,0x00E0,0x0E00,0x00EE,0x0E00,0x0000,0x0E00,
	0x0000,0xEE00,0x0000,0xE000,0x0000,0xE000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x000E,0xE000,0xEEEE,0x0EEE,

	0x0000,0x0E00,0x0000,0x0E00,0x0000,0x00E0,0x0000,0x000E,
	0x0000,0x000E,0xE000,0x000E,0xEEEE,0x0000,0x0000,0x0000,
	0x0000,0xE000,0x0000,0xE000,0x0000,0xE000,0x0000,0xE000,
	0x0000,0xE000,0x0000,0xE000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0xE000,0x0000,0xE000,0x0000,0xE000,0x0000,
	0xE000,0x0000,0xE000,0x0000,0xE000,0x0000,0xE000,0x0000,
	0xE000,0x0000,0xE000,0x0000,0xE000,0x0000,0xE000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0xE000,0xEEEE,0x0000,0xE000,
	0xE000,0x0000,0xE000,0x0000,0xE000,0x0000,0xE000,0x0000,
	0xE000,0x0000,0xE000,0x0000,0xE000,0x0000,0xEEEE,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0E00,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0xEE00,0x000E,
	0x0EE0,0x000E,0x00EE,0x000E,0x000E,0x000E,0x0000,0x000E,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0xEEEE,0x0000,0x000E,0x0000,0x000E,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0EEE,0x0000,0xE000,0x0000,0x0000,0x0EEE,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0xEEE0,0xEEEE,0x00EE,
	0xE000,0xEEEE,0x0E00,0x0000,0x0E00,0x0000,0x0E00,0x0000,
	0x0EE0,0x0000,0x00E0,0x0000,0x00E0,0x0000,0x000E,0x0000,

	0xEEEE,0x00EE,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0xE000,0x0000,0x0EE0,0x0000,0x00E0,0x0000,0x00E0,
	0xEE00,0xEEEE,0x0000,0x00E0,0x0000,0x00E0,0x0000,0x0EE0,
	0x0000,0x000E,0x0000,0x000E,0x0000,0x000E,0x0000,0x000E,
	0xEEEE,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0xEE00,0x0000,0xEE00,0x0000,0xEE00,
	0x0000,0xE000,0x0000,0xE000,0x0000,0xE000,0x0000,0xE000,

	0xEEEE,0x0000,0x0000,0x0EEE,0x0000,0xE000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x000E,0x0000,0x000E,0x0000,
	0x0000,0x000E,0x0000,0x000E,0xEEEE,0x000E,0xE000,0x000E,
	0xE000,0x000E,0xE000,0x0000,0xE000,0x0000,0x0000,0x0000,
	0x0000,0xEE00,0x0000,0xE000,0x0000,0xE000,0x0000,0xE000,
	0x0000,0xE000,0x0000,0xE000,0x0000,0xE000,0x0000,0xE000,
	0x0000,0x0EE0,0x0000,0x00E0,0x0000,0x0EE0,0x0000,0x0E00,
	0x0000,0x0E00,0x0000,0x0E00,0x0000,0xE000,0x0000,0xE000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0xE000,0xE000,0x0EEE,0xEEEE,0x0000,0x0000,0x0000,
	0x00EE,0x0000,0x00E0,0x0000,0x00E0,0x0000,0x00E0,0x0000,
	0x00EE,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0xE000,0x0000,0xE000,0x0000,0xE000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0xEE00,0x0000,0xE000,0x0000,0xE000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0xE000,0x000E,0xEE00,0xEEE0,0x00EE,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x000E,0xE000,0x000E,0x0000,0x000E,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x00EE,0x0000,0x00EE,0x0000,0x00EE,0x0000,0x00EE,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

const unsigned short winScreenMap[1024] __attribute__((aligned(4)))=
{
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x5001,0x5002,0x0000,0x0000,0x0000,0x5003,
	0x0000,0x5004,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x5005,0x0000,0x0000,0x0000,0x0000,0x5006,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x5007,0x5C01,0x0000,0x0000,0x0000,0x0000,0x5008,
	0x0000,0x0000,0x0000,0x0000,0x5009,0x500A,0x540A,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x500B,0x0000,0x0000,0x500C,0x0000,0x0000,0x5808,
	0x0000,0x5001,0x500D,0x0000,0x500E,0x500F,0x5010,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x5011,0x0000,0x0000,0x5012,0x0000,0x5013,0x5014,
	0x0000,0x5015,0x0000,0x0000,0x5016,0x0000,0x5411,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x5017,0x5018,0x5019,0x501A,0x501B,0x501C,0x0000,
	0x0000,0x501D,0x0000,0x0000,0x5415,0x0000,0x5411,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x5415,0x0000,0x580C,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x5014,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x501E,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x501F,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x5020,0x5021,0x5022,0x5001,0x5023,0x0000,0x0000,
	0x5024,0x5025,0x5004,0x5026,0x5401,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x5027,0x5028,0x5029,0x502A,0x502B,0x502C,
	0x502D,0x502E,0x502F,0x5030,0x5031,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x5032,0x5C01,0x0000,0x5033,0x5034,0x5035,0x5036,
	0x0000,0x5804,0x5015,0x5404,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

const unsigned short winScreenPal[256] __attribute__((aligned(4)))=
{
	0x0000,0x0010,0x0200,0x0210,0x4000,0x4010,0x4200,0x6318,
	0x4210,0x001F,0x03E0,0x03FF,0x7C00,0x7C1F,0x7FE0,0x7FFF,
	0x0004,0x0007,0x000B,0x000F,0x0013,0x0017,0x001B,0x001F,
	0x0080,0x00E0,0x0160,0x01E0,0x0260,0x02E0,0x0360,0x03E0,
	0x0084,0x00E7,0x016B,0x01EF,0x0273,0x02F7,0x037B,0x03FF,
	0x1000,0x1C00,0x2C00,0x3C00,0x4C00,0x5C00,0x6C00,0x7C00,
	0x1004,0x1C07,0x2C0B,0x3C0F,0x4C13,0x5C17,0x6C1B,0x7C1F,
	0x1080,0x1CE0,0x2D60,0x3DE0,0x4E60,0x5EE0,0x6F60,0x7FE0,

	0x0842,0x0C63,0x14A5,0x1CE7,0x2529,0x2D6B,0x35AD,0x3DEF,
	0x4631,0x4E73,0x56B5,0x5EF7,0x6739,0x6F7B,0x77BD,0x7FFF,
	0x001F,0x007F,0x00FF,0x017F,0x01FF,0x027F,0x02FF,0x037F,
	0x03FF,0x03FC,0x03F8,0x03F4,0x03F0,0x03EC,0x03E8,0x03E4,
	0x03E0,0x0FE0,0x1FE0,0x2FE0,0x3FE0,0x4FE0,0x5FE0,0x6FE0,
	0x7FE0,0x7F80,0x7F00,0x7E80,0x7E00,0x7D80,0x7D00,0x7C80,
	0x7C00,0x7C03,0x7C07,0x7C0B,0x7C0F,0x7C13,0x7C17,0x7C1B,
	0x7C1F,0x701F,0x601F,0x501F,0x401F,0x301F,0x201F,0x101F,

	0x001F,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0421,0x0842,0x0C63,0x1084,0x14A5,0x18C6,0x1CE7,
	0x2108,0x2529,0x294A,0x2D6B,0x318C,0x35AD,0x39CE,0x3DEF,
	0x4210,0x4631,0x4A52,0x4E73,0x5294,0x56B5,0x5AD6,0x5EF7,
	0x6318,0x6739,0x6B5A,0x6F7B,0x739C,0x77BD,0x7BDE,0x7FFF,
};

//}}BLOCK(winScreen)
