// Stages.asm
if !{defined __STAGES__} {
define __STAGES__()
print "included Stages.asm\n"

// @ Description
// This file expands the stage select screen.

include "Color.asm"
include "FGM.asm"
include "Global.asm"
include "OS.asm"
include "Overlay.asm"
include "String.asm"
include "Texture.asm"

scope Stages {

    // @ Description
    // Stage IDs. Used in various loading sequences.
    scope id {
        // original stages
        constant PEACHS_CASTLE(0x00)
        constant SECTOR_Z(0x01)
        constant CONGO_JUNGLE(0x02)
        constant PLANET_ZEBES(0x03)
        constant HYRULE_CASTLE(0x04)
        constant YOSHIS_ISLAND(0x05)
        constant DREAM_LAND(0x06)
        constant SAFFRON_CITY(0x07)
        constant MUSHROOM_KINGDOM(0x08)
        constant DREAM_LAND_BETA_1(0x09)
        constant DREAM_LAND_BETA_2(0x0A)
        constant HOW_TO_PLAY(0x0B)
        constant MINI_YOSHIS_ISLAND(0x0C)
        constant META_CRYSTAL(0x0D)
        constant DUEL_ZONE(0x0E)
        constant RACE_TO_THE_FINISH(0x0F)
        constant FINAL_DESTINATION(0x10)
        constant BTX_FIRST(0x11)
        constant BTT_MARIO(0x11)
        constant BTT_FOX(0x12)
        constant BTT_DONKEY_KONG(0x13)
        constant BTT_SAMUS(0x14)
        constant BTT_LUIGI(0x15)
        constant BTT_LINK(0x16)
        constant BTT_YOSHI(0x17)
        constant BTT_FALCON(0x18)
        constant BTT_KIRBY(0x19)
        constant BTT_PIKACHU(0x1A)
        constant BTT_JIGGLYPUFF(0x1B)
        constant BTT_NESS(0x1C)
        constant BTP_MARIO(0x1D)
        constant BTP_FOX(0x1E)
        constant BTP_DONKEY_KONG(0x1F)
        constant BTP_SAMUS(0x20)
        constant BTP_LUIGI(0x21)
        constant BTP_LINK(0x22)
        constant BTP_YOSHI(0x23)
        constant BTP_FALCON(0x24)
        constant BTP_KIRBY(0x25)
        constant BTP_PIKACHU(0x26)
        constant BTP_JIGGLYPUFF(0x27)
        constant BTP_NESS(0x28)
        constant BTX_LAST(0x28)

        // new stages
        constant DEKU_TREE(0x29)
        constant FIRST_DESTINATION(0x2A)
        constant GANONS_TOWER(0x2B)
        constant KALOS_POKEMON_LEAGUE(0x2C)
        constant POKEMON_STADIUM_2(0x2D)
        constant SKYLOFT(0x2E)
        constant GLACIAL(0x2F)
        constant WARIOWARE(0x30)
        constant BATTLEFIELD(0x31)
        constant FLAT_ZONE(0x32)
        constant DR_MARIO(0x33)
        constant COOLCOOL(0x34)
        constant DRAGONKING(0x35)
        constant GREAT_BAY(0x36)
        constant FRAYS_STAGE(0x37)
        constant TOH(0x38)
		constant FOD(0x39)
        constant MUDA(0x3A)
        constant MEMENTOS(0x3B)
        constant SHOWDOWN(0x3C)
        constant SPIRALM(0x3D)
        constant N64(0x3E)
        constant MUTE(0x3F)
        constant MADMM(0x40)
        constant SMBBF(0x41)
        constant SMBO(0x42)
        constant BOWSERB(0x43)
        constant PEACH2(0x44)
        constant DELFINO(0x45)
        constant CORNERIA2(0x46)
        constant KITCHEN(0x47)
        constant BLUE(0x48)
        constant ONETT(0x49)
        constant ZLANDING(0x4A)
        constant FROSTY(0x4B)
        constant SMASHVILLE2(0x4C)
        constant BTT_DRM(0x4D)
        constant BTT_GND(0x4E)
        constant BTT_YL(0x4F)
        constant GREAT_BAY_SSS(0x50)
        constant BTT_DS(0x51)
        constant BTT_STG1(0x52)
        constant BTT_FALCO(0x53)
        constant BTT_WARIO(0x54)
        constant HTEMPLE(0x55)
        constant BTT_LUCAS(0x56)
        constant BTP_GND(0x57)
        constant NPC(0x58)
        constant BTP_DS(0x59)
        constant SMASHKETBALL(0x5A)
		constant BTP_DRM(0x5B)
		constant NORFAIR(0x5C)
		constant CORNERIACITY(0x5D)
		constant FALLS(0x5E)
		constant OSOHE(0x5F)
		constant YOSHI_STORY_2(0x60)
		constant WORLD1(0x61)
		constant FLAT_ZONE_2(0x62)
		constant GERUDO(0x63)
		constant BTP_YL(0x64)

        constant MAX_STAGE_ID(0x64)

        // not an actual id, some arbitary number Sakurai picked(?)
        constant RANDOM(0xDE)
    }

    // @ Description
    // type controls a branch that executes code for single player modes when 0x00 or skips that
    // entirely for 0x14. This branch can be found at 0x(TODO). (pulled from table @ 0xA7D20)
    scope type {
        constant PEACHS_CASTLE(0x14)
        constant SECTOR_Z(0x14)
        constant CONGO_JUNGLE(0x14)
        constant PLANET_ZEBES(0x14)
        constant HYRULE_CASTLE(0x14)
        constant YOSHIS_ISLAND(0x14)
        constant DREAM_LAND(0x14)
        constant SAFFRON_CITY(0x14)
        constant MUSHROOM_KINGDOM(0x14)
        constant DREAM_LAND_BETA_1(0x14)
        constant DREAM_LAND_BETA_2(0x14)
        constant HOW_TO_PLAY(0x00)
        constant MINI_YOSHIS_ISLAND(0x14)
        constant META_CRYSTAL(0x14)
        constant DUEL_ZONE(0x14)
        constant RACE_TO_THE_FINISH(0x00)
        constant FINAL_DESTINATION(0x00)
        constant BTP(0x00)
        constant BTT(0x00)
        constant CLONE(0x14)
    }

    // @ Descirption
    // Header file id for each stage (pulled from table @ 0xA7D20)
    scope header {
        // original stages
        constant PEACHS_CASTLE(0x0103)
        constant SECTOR_Z(0x0106)
        constant CONGO_JUNGLE(0x0105)
        constant PLANET_ZEBES(0x0101)
        constant HYRULE_CASTLE(0x0109)
        constant YOSHIS_ISLAND(0x0107)
        constant DREAM_LAND(0x00FF)
        constant SAFFRON_CITY(0x0108)
        constant MUSHROOM_KINGDOM(0x104)
        constant DREAM_LAND_BETA_1(0x0100)
        constant DREAM_LAND_BETA_2(0x0102)
        constant HOW_TO_PLAY(0x010B)
        constant MINI_YOSHIS_ISLAND(0x010E)
        constant META_CRYSTAL(0x10D)
        constant DUEL_ZONE(0x010C)
        constant RACE_TO_THE_FINISH(0x0127)
        constant FINAL_DESTINATION(0x010A)
        constant BTT_MARIO(0x010F)
        constant BTT_FOX(0x0110)
        constant BTT_DONKEY_KONG(0x0111)
        constant BTT_SAMUS(0x0112)
        constant BTT_LUIGI(0x0113)
        constant BTT_LINK(0x0114)
        constant BTT_YOSHI(0x0115)
        constant BTT_FALCON(0x0116)
        constant BTT_KIRBY(0x0117)
        constant BTT_PIKACHU(0x0118)
        constant BTT_JIGGLYPUFF(0x0119)
        constant BTT_NESS(0x011A)
        constant BTP_MARIO(0x011B)
        constant BTP_FOX(0x011C)
        constant BTP_DONKEY_KONG(0x011D)
        constant BTP_SAMUS(0x011E)
        constant BTP_LUIGI(0x011F)
        constant BTP_LINK(0x0120)
        constant BTP_YOSHI(0x0121)
        constant BTP_FALCON(0x0122)
        constant BTP_KIRBY(0x0123)
        constant BTP_PIKACHU(0x0124)
        constant BTP_JIGGLYPUFF(0x0125)
        constant BTP_NESS(0x0126)

        // new stages
        constant DEKU_TREE(0x0874)
        constant FIRST_DESTINATION(0x0877)
        constant GANONS_TOWER(0x087A)
        constant KALOS_POKEMON_LEAGUE(0x087D)
        constant POKEMON_STADIUM_2(0x0880)
        constant SKYLOFT(0x0883)
        constant GLACIAL(0x0886)
        constant WARIOWARE(0x0889)
        constant BATTLEFIELD(0x0871)
        constant FLAT_ZONE(0x088C)
        constant DR_MARIO(0x088F)
        constant COOLCOOL(0x892)
        constant DRAGONKING(0x895)
        constant GREAT_BAY(0x89B)
        constant FRAYS_STAGE(0x898)
        constant TOH(0x89E)
		constant FOD(0x8A1)
        constant MUDA(0x8A5)
        constant MEMENTOS(0x8A8)
        constant SHOWDOWN(0x8B6)
        constant SPIRALM(0x8B9)
        constant N64(0x8BC)
        constant MUTE(0x8BF)
        constant MADMM(0x8C2)
        constant SMBBF(0x8C5)
        constant SMBO(0x8C7)
        constant BOWSERB(0x8CA)
        constant PEACH2(0x8CD)
        constant DELFINO(0x8D0)
        constant CORNERIA2(0x8DE)
        constant KITCHEN(0x8E1)
        constant BLUE(0x8EC)
        constant ONETT(0x8F0)
        constant ZLANDING(0x8F3)
        constant FROSTY(0x90C)
        constant SMASHVILLE2(0x911)
        constant BTT_DRM(0x92B)
        constant BTT_GND(0x93A)
        constant BTT_YL(0x966)
        constant GREAT_BAY_SSS(0x941)
        constant BTT_DS(0x944)
        constant BTT_STG1(0x959)
        constant BTT_FALCO(0x960)
        constant BTT_WARIO(0x968)
        constant HTEMPLE(0x981)
        constant BTT_LUCAS(0x985)
        constant BTP_GND(0x989)
        constant NPC(0x98C)
        constant BTP_DS(0x98F)
        constant SMASHKETBALL(0x991)
		constant BTP_DRM(0x995)
		constant NORFAIR(0x998)
		constant CORNERIACITY(0x99C)
		constant FALLS(0x93C)
		constant OSOHE(0x9A0)
		constant YOSHI_STORY_2(0x9A3)
		constant WORLD1(0x9A9)
		constant FLAT_ZONE_2(0x9AB)
		constant GERUDO(0x9AD)
		constant BTP_YL(0x9B3)
    }

    scope function {
        constant PEACHS_CASTLE(0x8010B4AC)
        constant SECTOR_Z(0x80107FCC)
        constant CONGO_JUNGLE(0x80109FB4)
        constant PLANET_ZEBES(0x80108448)
        constant HYRULE_CASTLE(0x8010AB20)
        constant YOSHIS_ISLAND(0x80108C80)
        constant DREAM_LAND(0x801066D4)
        constant SAFFRON_CITY(0x8010B2EC)
        constant MUSHROOM_KINGDOM(0x80109C0C)

        // jal ra, t9 immediately to jr ra lol
        constant CLONE(0x801056F8)
    }

    // @ Description
    // Class will help us better determine which branches to take rather than relying on stage ID
    scope class {
        constant BATTLE(0x00)
        constant RTTF(0x01)
        constant BTP(0x02)
        constant BTT(0x03)
        constant SSS_PREVIEW(0x04)
    }

    constant ICON_WIDTH(40)
    constant ICON_HEIGHT(30)

    // Layout
    constant NUM_ROWS(3)
    constant NUM_COLUMNS(6)
    constant NUM_ICONS(NUM_ROWS * NUM_COLUMNS)
    constant NUM_PAGES(0x04)

    // list of instructions that read from the stage id (A press on versus stage select screen)
    // they're in order (you're welcome)

    // DONE
    // 800FC298 - reads from table at 0x8012C520, (stage file #, stage type #)
    // solution: change li @ 0x800FC29C to custom table by stage id
    // 800FC2CC - same as above
    // solution: same as above
    // 800FC2F0 - same as above
    // solution: same as above

    // DONE
    // 80104C14 - checks if this is a BTT/BTP stage or not
    // solution: add check for > than 28
    scope id_fix_1_: {
        OS.patch_start(0x00080424, 0x80104C24)
        j       id_fix_1_
        nop
        OS.patch_end()

        li      at, function_table          // at = function table
        sll     v0, v0, 0x0002              // v0 = offset in function table
        addu    at, at, v0                  // at = address in function table
        srl     v0, v0, 0x0002              // v0 = stage_id again
        lw      at, 0x0000(at)              // at = 0 if Bonus
        bnez    at, _corrected              // adjust path as necessary
        nop

        _original:
        jal     0x801048F8                  // original line 1
        nop                                 // original line 2
        j       0x80104C2C                  // take original path back
        nop

        _corrected:
        j       0x80104C34                  // take corrected path
        nop
    }

    // DONE
    // 8010DA90 - check for id.PLANET_ZEBES (later followed by check for id.MUSHROOM_KINGDOM)
    // soltuion: do nothing, there's a default later

    // DONE
    // 801056D0 - this is actually of importance (lol), this is what function runs for each stage < 9
    //            (ie what you can access on the stage select screen by default) so "multiplayer"
    //            stages with function. jalr based on this
    // solution: either enforce hyrule id here copy the function table somewhere else
    scope id_fix_2_: {
        OS.patch_start(0x00080ED4, 0x801056D4)
        j       id_fix_2_
        nop
        _id_fix_2_return:
        OS.patch_end()

        OS.patch_start(0x00080EEC, 0x801056EC)
        lw      t9, 0x0000(t9)
        OS.patch_end()


        addiu   sp, sp,-0x0010              // allocate stack space
        sw      t0, 0x0004(sp)              // save t0

        li      t9, function_table          // original line 1 (modified)
        slti    at, v1, 0x0009              // original line 2
        slti    t0, v1, id.BTX_LAST + 1     // check upper bound
        bnez    t0, _return                 // if (stage id is NOT a new stage), skip
        nop
        sll     t0, v1, 0x0002              // t0 = offset in function table
        addu    t0, t0, t9                  // t0 = address in function table
        lw      t0, 0x0000(t0)              // t0 = 0 if Bonus
        beqz    t0, _return                 // if (stage a new bonus stage), skip
        nop
        lli     at, OS.TRUE                 // set at

        _return:
        lw      t0, 0x0004(sp)              // restore t0
        addiu   sp, sp, 0x0010              // deallocate stack space
        j       _id_fix_2_return            // return
        nop
    }

    // TODO
    // 80116AE0 - i have NO idea (v hacky memory access)
    // solution: probably enforce hyrule id, look more into this

    // TODO
    // 80116B84 - stage id shifted (as per usual) and then added to some parameter in a0
    //            this calculated value is stored at 0x18(a1) right before this
    // solution: enforce hyrule id(?)

    // TODO
    // 80116B98 - same as above except calculated value is not stored at 0x18(a1). lw t0, 0x8(t9) where t9
    //            is the calculated value. some arithmetic is then used on t0 which is stored at 0x0014(a1)
    // soltuion: enforce hyrule id(?)

    // ALSO: figure out what the fuck A1 is in the last two notes
    // ok so it looks to be a function specific to each stage (on DL it renders the background chars)

    // DONE
    // 80114C9C - checks if we're playing on a board the platforms stage (greater than 10) to see
    //            if gameset or failure should happen
    // solution: add check for greater than last btx as well
    scope id_fix_5_: {
        OS.patch_start(0x0009049C, 0x80114C9C)
        j       id_fix_5_
        nop
        nop
        _id_fix_5_return:
        OS.patch_end()


        slti    at, t6, 0x0011              // original line 1
        bnez    at, _take_branch            // original line 2 (modified)
        lui     a1, 0x8011                  // original line 3

        li      at, function_table          // at = function table
        sll     t6, t6, 0x0002              // t6 = offset in function table
        addu    at, at, t6                  // at = address in function table
        srl     t6, t6, 0x0002              // t6 = stage_id again
        lw      at, 0x0000(at)              // at = 0 if Bonus
        bnez    at, _take_branch            // account for new stage ids
        nop

        _continue:
        j       _id_fix_5_return            // don't take branch
        nop

        _take_branch:
        j       0x80114CC8                  // branch to take
        nop
    }

    // DONE    
    // 8013C2BC - same as above except does not alter gameset/failure. unsure of what this does
    // solution: same as above, probably won't hurt
    scope id_fix_6_: {
        OS.patch_start(0x000B6D00, 0x8013C2C0)
        jal     id_fix_6_
        nop
        nop
        OS.patch_end()

        OS.patch_start(0x000B6E48, 0x8013C408)
        jal     id_fix_6_
        nop
        nop
        OS.patch_end()

        OS.patch_start(0x000B6F90, 0x8013C550)
        jal     id_fix_6_
        nop
        nop
        OS.patch_end()

        slti    at, v0, 0x0011              // original line 1
        bnez    at, _take_branch            // original line 2 (modified)
        nop 

        li      at, class_table             // at = class_table
        addu    at, at, v0                  // at = address of class
        lbu     at, 0x0000(at)              // at = class
        beqz    at, _take_branch            // take branch when a battle stage
        nop

        j       0x8013C2E4                  // branch to complete/failure
        nop

        _take_branch:
        j       0x8013C2EC                  // branch to battle end
        lli     at, 0x0000                  // at = 0
    }

    // @ Description
    // This uses our class table to determine which branches to take so that new stages work
    scope bonus_fix_1_: {
        constant BTP_JAL(0x8018DC38)
        constant BTT_JAL(0x8018D5C8)

        OS.patch_start(0x00080F20, 0x80105720)
        jal     bonus_fix_1_
        nop
        beq     r0, r0, 0x8010574C          // skip to end
        nop
        OS.patch_end()

        // v0 is stage_id
        li      at, class_table             // at = class_table
        addu    at, at, v0                  // at = address of class
        lbu     at, 0x0000(at)              // at = class

        beqz    at, _return                 // if at = class.BATTLE (0), then skip to end
        nop

        addiu   sp, sp,-0x0010              // allocate stack space
        sw      t0, 0x0004(sp)              // ~
        sw      t1, 0x0008(sp)              // ~
        sw      ra, 0x000C(sp)              // save registers

        lli     t0, class.BTT               // t0 = class.BTT
        li      t1, BTT_JAL                 // t1 = BTT_JAL
        beq     t0, at, _end                // if BTT, use BTT_JAL
        nop

        li      t1, BTP_JAL                 // else use BTP_JAL

        _end:
        jalr    t1                          // call routine
        nop

        lw      t0, 0x0004(sp)              // ~
        lw      t1, 0x0008(sp)              // ~
        lw      ra, 0x000C(sp)              // restore registers
        addiu   sp, sp, 0x0010              // deallocate stack space

        _return:
        jr      ra
        nop
    }

    // @ Description
    // This allows us to extend the hardcodings for targets
    scope bonus_fix_2_: {
        OS.patch_start(0x111B00, 0x8018D3C0)
        jal     bonus_fix_2_
        nop
        swc1    f20, 0x0050(sp)
        swc1    f20, 0x004C(sp)
        swc1    f20, 0x0048(sp)
        nop
        OS.patch_end()

        // t7 is stage_id
        li      t0, bonus_pointer_table    // t0 = bonus_pointer_table
        sll     t8, t7, 0x0002             // t8 = offset in bonus_pointer_table
        addu    t0, t0, t8                 // t0 = address in bonus_pointer_table
        lw      v0, 0x0000(t0)             // v0 = bonus pointer

        jr      ra
        nop
    }

    // @ Description
    // This corrects some ID checks related to determining BTT or BTP
    scope bonus_fix_3_: {
        OS.patch_start(0x11248C, 0x8018DD4C)
        jal     bonus_fix_3_
        ori     a2, a2, 0xD97C             // original line 1
        OS.patch_end()

        OS.patch_start(0x1127E8, 0x8018E0A8)
        jal     bonus_fix_3_
        lbu     t7, 0x0001(t6)             // original line 1
        OS.patch_end()

        OS.patch_start(0x1130C0, 0x8018E980)
        jal     bonus_fix_3_
        lbu     t7, 0x0001(a0)             // original line 1
        OS.patch_end()

        OS.patch_start(0x1132C8, 0x8018EB88)
        jal     bonus_fix_3_
        lbu     t7, 0x0001(v0)             // original line 1 (modified for t7 instead of t3)
        lui     a0, 0x8013                 // original line 2
        OS.patch_end()

        addiu   sp, sp,-0x0008             // allocate stack space
        sw      a1, 0x0004(sp)             // save registers

        // t7 is stage_id
        li      at, class_table            // at = class_table
        addu    at, at, t7                 // at = address of class
        lbu     at, 0x0000(at)             // at = class

        lli     a1, class.BTT              // a1 = class.BTT
        beql    a1, at, _return            // if BTT, set at to 1 and return
        lli     at, 0x0001                 // ~

        lli     at, 0x0000                 // otherwise set at to 0

        _return:
        lw      a1, 0x0004(sp)             // restore registers
        addiu   sp, sp, 0x0008             // deallocate stack space

        jr      ra                         // return
        nop
    }

    // @ Description
    // This allows us to extend the hardcodings for platforms
    scope bonus_fix_4_: {
        OS.patch_start(0x1122B4, 0x8018DB74)
        swc1    f20, 0x0050(sp)            // original line 4
        swc1    f20, 0x004C(sp)            // original line 5
        swc1    f20, 0x0048(sp)            // original line 6
        lbu     t1, 0x0001(v1)             // original line 7
        addiu   s4, sp, 0x0050             // original line 9

        // t3, t4 and v0 need to be set

        // t7 is stage_id
        li      t9, bonus_pointer_table    // t9 = bonus_pointer_table
        sll     t8, t7, 0x0002             // t8 = offset in bonus_pointer_table
        addu    t9, t9, t8                 // t9 = address in bonus_pointer_table
        lw      t0, 0x0000(t9)             // t0 = bonus pointer

        lw      t3, 0x0000(t0)             // t3 = offset 1
        lw      t4, 0x0004(t0)             // t4 = offset 2

        subu    v0, a1, t3                 // original line 8, modified
        OS.patch_end()
    }

    // @ Description
    // Disable original L/R, D-pad and C button behavior
    // left
    OS.patch_start(0x0014FC50, 0x801340E0)
    or       v0, r0, r0                     // don't check input and instead return that nothing is pressed
    OS.patch_end()
    // right
    OS.patch_start(0x0014FD54, 0x801341E4)
    or       v0, r0, r0                     // don't check input and instead return that nothing is pressed
    OS.patch_end()
    // down
    OS.patch_start(0x0014FB80, 0x80134010)
    or       v0, r0, r0                     // don't check input and instead return that nothing is pressed
    OS.patch_end()
    // up
    OS.patch_start(0x0014FAAC, 0x80133F3C)
    or       v0, r0, r0                     // don't check input and instead return that nothing is pressed
    OS.patch_end()

    // @ Description
    // Prevents series logo from being drawn on wood circle
    OS.patch_start(0x0014E418, 0x801328A8)
    jr      ra                              // return immediately
    nop
    OS.patch_end()

    // @ Description
    // Prevents the drawing of defaults icons
    OS.patch_start(0x0014E098, 0x80132528)
    jr      ra                              // return
    nop
    OS.patch_end()

    // @ Description
    // Prevents "Stage Select" texture from being drawn.
    OS.patch_start(0x0014DDF8, 0x80132288)
    jr      ra                              // return immediately
    nop
    OS.patch_end()

    // @ Descirption
    // Prevents the wooden circle from being drawn.
    OS.patch_start(0x0014DBB8, 0x80132048)
//  jr      ra                              // return immediately
//  nop
    OS.patch_end()

    // @ Description
    // Prevents stage name text from being drawn.
    OS.patch_start(0x0014E2A8, 0x80132738)
    jr      ra                              // return immediately
    nop
    OS.patch_end()

    // Modifies the x/y position of the models on the stage select screen.
    OS.patch_start(0x0014F514, 0x801339A4)
//  lwc1    f16,0x0000(v0)                  // original line 1 (f16 = (float) x)
//  swc1    f16,0x0048(a0)                  // original line 2
//  lwc1    f18,0x0004(v0)                  // original line 3 (f18 = (float) y)
//  swc1    f18,0x004C(a0)                  // original line 4
    lui     t8, 0x44C8                      // t8 = (float) 1600S
    sw      t8, 0x0048(a0)                  // x = 1600
    sw      t8, 0x004C(a0)                  // y = 1600
    nop
    OS.patch_end()

    // @ Description
    // These following functions are designed to fix get_header_ for RANDOM.
    scope random_fix_1_: {
        OS.patch_start(0x0014EF2C, 0x801333BC)
        j       random_fix_1_
        nop
        _random_fix_1_return:
        OS.patch_end()

        addiu   at, r0, 0x00DE                  // original line 1
        or      s0, a0, r0                      // original line 2

        addiu   sp, sp,-0x0010                  // allocate stack space
        sw      v0, 0x0004(sp)                  // ~
        sw      ra, 0x0008(sp)                  // restore registers

        jal     get_stage_id_                   // v0 = stage_id
        nop
        move    a0, v0                          // a0 = stage_id

        lw      v0, 0x0004(sp)                  // ~
        lw      ra, 0x0008(sp)                  // restore registers
        addiu   sp, sp, 0x0010                  // deallocate stack space
        j       _random_fix_1_return            // return
        nop
    }

    scope random_fix_2_: {
        OS.patch_start(0x0014EFA4, 0x80133434)
        j       random_fix_2_
        nop
        _random_fix_2_return:
        OS.patch_end()

//      lli     at, 0x00DE                      // original line 1
//      beq     s0, at, 0x80133464              // original line 2

        addiu   sp, sp,-0x0010                  // allocate stack space
        sw      ra, 0x0004(sp)                  // ~
        sw      v0, 0x0008(sp)                  // save registers

        jal     get_stage_id_                   // v0 = stage_id
        nop
        lli     at, 0x00DE
        beq     at, v0, _take_branch
        nop

        _default:
        lw      ra, 0x0004(sp)                  // ~
        lw      v0, 0x0008(sp)                  // restore registers
        addiu   sp, sp, 0x0010                  // deallocate stack
        j       _random_fix_2_return
        nop

        _take_branch:
        lw      ra, 0x0004(sp)                  // ~
        lw      v0, 0x0008(sp)                  // restore registers
        addiu   sp, sp, 0x0010                  // deallocate stack
        j       0x80133464                      // (from original line 2)
        nop
    }

    scope random_fix_3_: {
        OS.patch_start(0x0014E950, 0x80132DE0)
        j       random_fix_3_
        nop
        _random_fix_3_return:
        OS.patch_end()

//      bne     v1, at, 0x80132E18              // original line 1
//      lui     t0, 0x8013                      // original line 2

        addiu   sp, sp,-0x0010                  // allocate stack space
        sw      ra, 0x0004(sp)                  // ~
        sw      v0, 0x0008(sp)                  // save registers

        jal     get_stage_id_                   // v0 = stage_id
        nop
        bne     at, v0, _take_branch
        nop

        _default:
        lw      ra, 0x0004(sp)                  // ~
        lw      v0, 0x0008(sp)                  // restore registers
        addiu   sp, sp, 0x0010                  // deallocate stack
        j       _random_fix_3_return            // return
        nop

        _take_branch:
        lw      ra, 0x0004(sp)                  // ~
        lw      v0, 0x0008(sp)                  // restore registers
        addiu   sp, sp, 0x0010                  // deallocate stack
        j       0x80132E18                      // (from original line 1)
        nop
    }

    // @ Description
    // Modifies the zoom of the model previews.
    scope set_zoom_: {
        OS.patch_start(0x0014ECE4, 0x80133174)
//      lwc1    f4, 0x0000(v1)              // original line 1
        j       set_zoom_
        or      v0, s0, r0                  // original line 2
        _set_zoom_return:
        OS.patch_end()

        addiu   sp, sp,-0x00010             // allocate stack space
        sw      ra, 0x0004(sp)              // ~
        sw      v0, 0x0008(sp)              // ~
        sw      t0, 0x000C(sp)              // save registesr

        jal     get_stage_id_               // v0 = stage_id
        nop
        sll     v0, v0, 0x0002              // v0 = stage_id * sizeof(word)
        li      t0, zoom_table              // ~
        addu    t0, t0, v0                  // t0 = address of zoom
        lw      t0, 0x0000(t0)              // t0 = zoom
        mtc1    t0, f4                      // f4 = zoom
        swc1    f4, 0x0000(v1)              // update all zoom

        lw      ra, 0x0004(sp)              // ~
        lw      v0, 0x0008(sp)              // ~
        lw      t0, 0x000C(sp)              // restore registers
        addiu   sp, sp, 0x0010              // deallocate stack space
        j       _set_zoom_return
        nop
    }

    // @ Description
    // This functions modifies which header file is drawn based on stage_table
    scope get_header_: {
        OS.patch_start(0x0014E708, 0x80132B98)
        j       get_header_
        nop
        _get_header_return:
        OS.patch_end()

        addiu   sp, sp,-0x0010                  // allocate stack space
        sw      ra, 0x0004(sp)                  // ~
        sw      t0, 0x0008(sp)                  // ~
        sw      v0, 0x000C(sp)                  // save registers

        jal     get_stage_id_                   // v0 = stage_id
        nop
        addiu   t0, r0, id.GREAT_BAY            
        bne     v0, t0, _standard              // This branch is done for Great Bay, it loads an alternate model for the SSS
        nop
        li      v0, id.GREAT_BAY_SSS 

        _standard:
        sll     v0, v0, 0x0003                  // t0 = offset << 3 (offset * 8)
        li      t0, stage_file_table            // ~
        addu    t0, v0, t0                      // t0 = address of header file

        addu    v1, t6, t7                      // original line 1
//      lw      a0, 0x0000(v1)                  // original line 2
        lw      a0, 0x0000(t0)                  // a0 - file header id

        lw      ra, 0x0004(sp)                  // ~
        lw      t0, 0x0008(sp)                  // ~
        lw      v0, 0x000C(sp)                  // restore registers
        addiu   sp, sp, 0x0010                  // deallocate stack space
        j       _get_header_return              // return
        nop
    }

    // @ Description
    // This functions modifies which preview type is used based on stage_table
    scope get_type_: {
        OS.patch_start(0x0014E720, 0x80132BB0)
        j       get_type_
        nop
        _get_type_return:
        OS.patch_end()

        addiu   sp, sp,-0x0010                  // allocate stack space
        sw      ra, 0x0004(sp)                  // ~
        sw      t0, 0x0008(sp)                  // ~
        sw      v0, 0x000C(sp)                  // save registers

        jal     get_stage_id_                   // v0 = stage_id
        nop
        sll     v0, v0, 0x0003                  // t0 = offset << 3 (offset * 8)
        li      t0, stage_file_table            // ~
        addu    t0, v0, t0                      // t0 = address of header file
        addiu   t0, t0, 0x0004                  // t0 = address of type
        lw      t8, 0x0000(t0)                  // t8 = type

        lw      ra, 0x0004(sp)                  // ~
        lw      t0, 0x0008(sp)                  // ~
        lw      v0, 0x000C(sp)                  // resore registers
        addiu   sp, sp, 0x0010                  // deallocate stack space
        lui     at, 0x8013                      // original line 1
//      lw      t8, 0x0004(v1)                  // original line 2
        j       _get_type_return                // return
        nop
    }

    // @ Descirption
    // Draw stage icons to the screen
    scope draw_icons_: {
        addiu   sp, sp,-0x0028              // allocate stack space
        sw      t0, 0x0004(sp)              // ~
        sw      t1, 0x0008(sp)              // ~
        sw      t2, 0x000C(sp)              // ~
        sw      t3, 0x0010(sp)              // ~
        sw      t4, 0x0014(sp)              // ~
        sw      ra, 0x0018(sp)              // ~
        sw      at, 0x001C(sp)              // ~
        sw      t5, 0x0020(sp)              // ~
        sw      t6, 0x0024(sp)              // save registers

        _setup:
        lli     at, NUM_ICONS               // at = number of icons to draw
        li      t0, icon_table              // t0 = address of icon_table
        li      t1, position_table          // t1 = address of position_table
        lli     t2, 0x0000                  // t2 = index
        li      t3, stage_table             // t3 = address of stage_table pointers
        li      t5, Toggles.entry_sss_layout
        lw      t5, 0x0004(t5)              // t5 = stage table index
        sll     t5, t5, 0x0002              // t5 = offset to stage_table to use
        addu    t3, t3, t5                  // t3 = address of stage_table pointer
        lw      t3, 0x0000(t3)              // t3 = address of stage_table to use
        lli     t5, NUM_ICONS               // ~
        li      t6, page_number             // ~
        lw      t6, 0x0000(t6)              // ~
        mult    t5, t6                      // ~
        mflo    t6                          // t6 = stage_table page offset
        addu    t3, t3, t6                  // t3 = stage_table + page offset

        _draw_icon:
        sltiu   at, t2, NUM_ICONS           // ~
        beqz    at, _end                    // check to stop drawing stage icons
        nop
        lw      a0, 0x0000(t1)              // a0 - ulx
        lw      a1, 0x0004(t1)              // a1 - uly
        addu    t4, t3, t2                  // t4 = address of stage_table[index]
        lbu     t4, 0x0000(t4)              // t4 = stage_id

        // this interupts flow to check for random
        lli     at, id.RANDOM               // at = id.RANDOM
        bne     t4, at, _not_random         // if (stage_id != id.RANDOM), skip
        nop
        li      t4, icon_random             // ~
        b       _continue
        nop

        _not_random:
        sll     t4, t4, 0x0002              // t4 = stage_id * 4 (aka stage_id * sizeof(u32))
        addu    t4, t0, t4                  // t4 = address of icon_table + offset
        lw      t4, 0x0000(t4)              // t4 = address of image data

        _continue:
        li      a2, info                    // a2 - address of texture struct
        sw      t4, 0x00008(a2)             // update info image data
        jal     Overlay.draw_texture_       // draw icon
        nop

        _increment:
        addiu   t1, t1, 0x0008              // increment position_table
        addiu   t2, t2, 0x0001              // increment index
        b       _draw_icon                  // draw next icon
        nop

        _end:
        lw      t0, 0x0004(sp)              // ~
        lw      t1, 0x0008(sp)              // ~
        lw      t2, 0x000C(sp)              // ~
        lw      t3, 0x0010(sp)              // ~
        lw      t4, 0x0014(sp)              // ~
        lw      ra, 0x0018(sp)              // ~
        lw      at, 0x001C(sp)              // ~
        lw      t5, 0x0020(sp)              // ~
        lw      t6, 0x0024(sp)              // restore registers
        addiu   sp, sp, 0x0028              // deallocate stack space
        jr      ra                          // return
        nop

        info:
        Texture.info(ICON_WIDTH, ICON_HEIGHT)
    }

    // @ Description
    // This replaces the previous the original draw cursor function. The new function draws based on
    // the Stages.row and Stages.column variables as well as the position_table. It also replaces
    // the cursor itself with a filled rectangle
    scope draw_cursor_: {

        // @ Description
        // Set original cursor position.
        OS.patch_start(0x0014E5C8, 0x80132A58)
        // not used, for documentation only
        OS.patch_end()

        // @ Description
        // (part of set cursor position)
        OS.patch_start(0x0014E5F4, 0x80132A84)
//      lui     at, 0x41B8                  // original line (at = (float cursor y))
        lui     at, 0xC800                  // at =  a very negative float
        OS.patch_end()

        // @ Description
        // (part of set cursor position)
        OS.patch_start(0x0014E62C, 0x80132ABC)
//      lui     at, 0x4274                  // original line (at = (float cursor y))
        lui     at, 0xC800                  // at =  a very negative float
        OS.patch_end()

        addiu   sp, sp,-0x0010              // allocate stack space
        sw      t0, 0x0004(sp)              // ~
        sw      ra, 0x0008(sp)              // save registesr

        // this block gets the position
        jal     get_index_                  // v0 = index
        nop
        sll     v0, v0, 0x0003              // v0 = index *= sizeof(position_table entry) = offset
        li      t0, position_table          // ~
        addu    t0, t0, v0                  // t0 = position_table + offset

        // this block selects color based of rectangle (based on hazard mode)
        li      at, Toggles.entry_hazard_mode
        lw      at, 0x0004(at)              // t0 = hazard mode
        beqzl   at, _skip
        lli     a0, Color.low.RED           // a0 - fill color
        lli     a0, Color.low.BLUE          // a0 - fill color

        _skip:
        // this block draws the cursor (with a border of 2)
        jal     Overlay.set_color_          // fill color = RED
        nop
        lw      a0, 0x0000(t0)              // a0 - ulx
        addiu   a0, a0,-0x0002              // decrement ulx
        lw      a1, 0x0004(t0)              // a1 - uly
        addiu   a1, a1,-0x0002              // decrement uly
        lli     a2, ICON_WIDTH + 4          // a2 - width
        lli     a3, ICON_HEIGHT + 4         // a3 - height
        jal     Overlay.draw_rectangle_     // draw curso
        nop

        lw      t0, 0x0004(sp)              // ~
        lw      ra, 0x0008(sp)              // restore registers
        addiu   sp, sp, 0x0010              // deallocate stack sapce
        jr      ra                          // return
        nop
    }

    // @ Description
    // Temporary. Draws names of stages where the stage text usually appears.
    scope draw_names_: {
        addiu   sp, sp,-0x0018              // allocate stack space
        sw      a0, 0x0004(sp)              // ~
        sw      a1, 0x0008(sp)              // ~
        sw      a2, 0x000C(sp)              // ~
        sw      v0, 0x0010(sp)              // ~
        sw      ra, 0x0014(sp)              // save registers

        // this block draws "Smash Remix"
        lli     a0, 232                     // a0 - ulx
        lli     a1, 130                     // a1 - uly
        li      a2, string_title            // a2 - address of string
        jal     Overlay.draw_centered_str_  // draw string
        nop

        // this block draws "<stage_name>"
        jal     get_stage_id_               // v0 = stage_id
        nop
        lli     a0, id.RANDOM               // a0 = random
        beq     a0, v0, _end                // don't draw RANDOM
        nop
        sll     v0, v0, 0x0002              // v0 = offset = stage_id * 4
        lli     a0, 232                     // a0 - x
        lli     a1, 210                     // a1 - uly
        li      a2, string_table            // a2 = address of string_table
        addu    a2, a2, v0                  // a2 = address of string_table + offset
        lw      a2, 0x0000(a2)              // a2 - adress of string
        jal     Overlay.draw_centered_str_  // draw string
        nop

        _end:
        lw      a0, 0x0004(sp)              // ~
        lw      a1, 0x0008(sp)              // ~
        lw      a2, 0x000C(sp)              // ~
        lw      v0, 0x0010(sp)              // ~
        lw      ra, 0x0014(sp)              // restore registers
        addiu   sp, sp, 0x0018              // deallocate stack space
        jr      ra                          // return
        nop

        string_title:
        String.insert("Smash Remix")
    }

    scope draw_page_number_: {
        addiu   sp, sp,-0x0018              // allocate stack space
        sw      a0, 0x0004(sp)              // ~
        sw      a1, 0x0008(sp)              // ~
        sw      a2, 0x000C(sp)              // ~
        sw      v0, 0x0010(sp)              // ~
        sw      ra, 0x0014(sp)              // save registers

        // this block draws the legend text
        lli     a0, 160                     // a0 - x
        lli     a1, 117                     // a1 - uly
        li      a2, string_page             // a2 - address of string
        jal     Overlay.draw_centered_str_  // draw string
        nop

        // this block draws page number 
        li      a0, page_number             // ~
        lw      a0, 0x0000(a0)              // a0 - (int) page_number
        addiu   a0, a0, 0x0001              // make it normie readable
        jal     String.itoa_                // v0 = (string) page_number
        nop
        lli     a0, 000081                  // a0 - x
        lli     a1, 000117                  // a1 - uly
        move    a2, v0                      // a2 - address of string
        jal     Overlay.draw_string_        // draw string
        nop

        // draw "R" button
        lli     a0, 000111                  // a0 - ulx
        lli     a1, 000114                  // a1 - uly
        li      a2, Data.r_button_info      // a2 - address of texture struct
        jal     Overlay.draw_texture_       // draw options text texture
        nop

        // draw "Z" button
        lli     a0, 000095                  // a0 - ulx
        lli     a1, 000113                  // a1 - uly
        li      a2, Data.z_button_info      // a2 - address of texture struct
        jal     Overlay.draw_texture_       // draw options text texture
        nop

        // draw "L" button
        lli     a0, 000169                  // a0 - ulx
        lli     a1, 000114                  // a1 - uly
        li      a2, Data.l_button_info      // a2 - address of texture struct
        jal     Overlay.draw_texture_       // draw options text texture
        nop

        _end:
        lw      a0, 0x0004(sp)              // ~
        lw      a1, 0x0008(sp)              // ~
        lw      a2, 0x000C(sp)              // ~
        lw      v0, 0x0010(sp)              // ~
        lw      ra, 0x0014(sp)              // restore registers
        addiu   sp, sp, 0x0018              // deallocate stack space
        jr      ra                          // return
        nop

        string_page:
        String.insert("Page:   /  :+/-   :Hazard Mode")
    }

    // @ Description
    // Returns an index based on column and row
    // @ Returns
    // v0 - index
    scope get_index_: {
        addiu   sp, sp,-0x0010              // allocate stack space
        sw      t0, 0x0004(sp)              // ~
        sw      t1, 0x0008(sp)              // ~
        sw      t2, 0x000C(sp)              // save registers

        li      t0, row                     // ~
        lw      t0, 0x0000(t0)              // t0 = row
        li      t1, column                  // ~
        lw      t1, 0x0000(t1)              // t1 = column
        lli     t2, NUM_COLUMNS             // t2 = NUM_COLUMNS
        multu   t0, t2                      // ~
        mflo    v0                          // v0 = row * NUM_COLUMNS
        addu    v0, v0, t1                  // v0 = row * NUM_COLUMNS + column

        lw      t0, 0x0004(sp)              // ~
        lw      t1, 0x0008(sp)              // ~
        lw      t2, 0x000C(sp)              // restore registers
        addiu   sp, sp, 0x0010              // deallocate stack space
        jr      ra
        nop
    }

    // @ Description
    // returns a stage id based on cursor position
    // @ Returns
    // v0 - stage_id
    scope get_stage_id_: {
        addiu   sp, sp,-0x0018              // allocate stack space
        sw      t0, 0x0004(sp)              // ~
        sw      ra, 0x0008(sp)              // ~
        sw      t1, 0x000C(sp)              // ~
        sw      t2, 0x0010(sp)              // save registers

        jal     get_index_                  // v0 = index
        nop
        li      t1, page_number             // ~
        lw      t1, 0x0000(t1)              // ~
        lli     t2, NUM_ICONS               // ~
        mult    t1, t2                      // multiply NUM_ICONS by page
        mflo    t1                          // ~
        addu    v0, v0, t1                  // add additional offset
        li      t0, stage_table             // t0 = address of stage table
        li      t1, Toggles.entry_sss_layout
        lw      t1, 0x0004(t1)              // t1 = stage table index
        sll     t1, t1, 0x0002              // t1 = offset to stage_table to use
        addu    t0, t0, t1                  // t0 = address of stage_table pointer
        lw      t0, 0x0000(t0)              // t0 = address of stage_table to use
        addu    t0, t0, v0                  // t0 = address of stage table + offset
        lbu     v0, 0x0000(t0)              // v0 = ret = stage_id

        lw      t0, 0x0004(sp)              // ~
        lw      ra, 0x0008(sp)              // ~
        lw      t1, 0x000C(sp)              // ~
        lw      t2, 0x0010(sp)              // restore registers
        addiu   sp, sp, 0x0018              // deallocate stack space
        jr      ra                          // return
        nop
    }

    // @ Description
    // This is what Overlay.HOOKS_GO_HERE_ calls. It is the main() of Stages.asm
    scope run_: {
        addiu   sp, sp,-0x0028              // allocate stack space
        sw      ra, 0x0004(sp)              // ~
        sw      a0, 0x0008(sp)              // ~
        sw      a1, 0x000C(sp)              // ~
        sw      a2, 0x0010(sp)              // ~
        sw      v0, 0x0014(sp)              // ~
        sw      t0, 0x0018(sp)              // ~
        sw      t1, 0x001C(sp)              // ~
        sw      at, 0x0020(sp)              // save registers

        // check for L button press to toggle hazard mode
        li      a0, Joypad.L                // a0 - button mask
        li      a2, Joypad.PRESSED          // a2 - type
        jal     Joypad.check_buttons_all_   // v0 = L pressed
        nop
        beqz    v0, _draw                   // if not pressed, skip
        nop
        li      t0, Toggles.entry_hazard_mode
        lw      t1, 0x0004(t0)              // t1 = hazard_mode
        addiu   t1, t1, 0x0001              // t1 = t1 + 1
        andi    t1, t1, 0x0003              // t1 between 0 and 3
        sw      t1, 0x0004(t0)
        lli     a0, FGM.menu.TOGGLE         // a0 - fgm_id
        jal     FGM.play_                   // play menu sound
        nop

        _draw:
        jal     draw_cursor_                // draw selection cursor
        nop

        jal     draw_icons_                 // draw stage icons
        nop

        jal     draw_names_                 // draw stage names
        nop

        jal     draw_page_number_           // draw page number
        nop

        // this block draws the hazards/movement on/off modal messages
        lli     a0, 193                     // a0 - x
        lli     a1, 158                     // a1 - uly
        li      a2, string_hazards          // a2 = string table
        jal     Overlay.draw_string_        // draw string
        nop

        lli     a0, 185                     // a0 - x
        lli     a1, 168                     // a1 - uly
        li      a2, string_movement         // a2 = string table
        jal     Overlay.draw_string_        // draw string
        nop

        li      t0, Toggles.entry_hazard_mode
        lw      t1, 0x0004(t0)              // t1 = hazard_mode

        lli     a0, 255                     // a0 - x
        lli     a1, 158                     // a1 - uly
        andi    t0, t1, 0x0001              // t0 = 1 if hazard_mode is 1 or 3, 0 otherwise
        li      a2, string_on               // a2 = string on
        beqz    t0, _draw_hazards_on_off    // if hazards off, show off string
        nop
        li      a2, string_off              // a2 = string off
        _draw_hazards_on_off:
        jal     Overlay.draw_string_        // draw string
        nop

        lli     a0, 255                     // a0 - x
        lli     a1, 168                     // a1 - uly
        srl     t0, t1, 0x0001              // t0 = 1 if hazard_mode is 2 or 3, 0 otherwise
        li      a2, string_on               // a2 = string on
        beqz    t0, _draw_movement_on_off   // if hazards off, show off string
        nop
        li      a2, string_off              // a2 = string off
        _draw_movement_on_off:
        jal     Overlay.draw_string_        // draw string
        nop

        lw      ra, 0x0004(sp)              // ~
        lw      a0, 0x0008(sp)              // ~
        lw      a1, 0x000C(sp)              // ~
        lw      a2, 0x0010(sp)              // ~
        lw      v0, 0x0014(sp)              // ~
        lw      t0, 0x0018(sp)              // ~
        lw      t1, 0x001C(sp)              // ~
        lw      at, 0x0020(sp)              // restore registers
        addiu   sp, sp, 0x0028              // deallocate stack space
        jr      ra                          // return
        nop

        string_hazards:; String.insert("Hazards:")
        string_movement:;  String.insert("Movement:")
        string_on:;  String.insert("On")
        string_off:;  String.insert("Off")
    }

    // @ Description
    // Each of these is a former update_right_ functions by Sakurai. They have
    // been extended to update the Stages.asm cursor.
    scope right_check_: {
        OS.patch_start(0x0014FD70, 0x80134200)
        j       right_check_
        nop
        _return:
        OS.patch_end()

        // original line (if v0 == 0, skip right_)
//      beq         v0, r0, 0x801342F4      // original line 1
        beq         v0, r0, page_switch     // original line 1 (modified)
        sw          v0, 0x0020(sp)          // original line 2

        j           right_                  // usually, this would go to right_ here
        nop

        page_switch:
        addiu   sp, sp,-0x0028              // allocate stack space
        sw      ra, 0x0004(sp)              // ~
        sw      a0, 0x0008(sp)              // ~
        sw      a1, 0x000C(sp)              // ~
        sw      a2, 0x0010(sp)              // ~
        sw      v0, 0x0014(sp)              // ~
        sw      t0, 0x0018(sp)              // ~
        sw      t1, 0x001C(sp)              // ~
        sw      at, 0x0020(sp)              // save registers

        // check for R press (increment page)
        _page_up:
        li      a0, Joypad.R                // a0 - button mask
        li      a2, Joypad.PRESSED          // a2 - type
        jal     Joypad.check_buttons_all_   // v0 = R pressed?
        nop
        beqz    v0, _page_down              // if r not pressed, skip
        nop
        li      t0, page_number             // ~
        lw      t1, 0x0000(t0)              // t1 = page number
        addiu   t1, t1, 0x0001              // increment page
        lli     at, NUM_PAGES               // ~
        beq     at, t1, _up_warp            // if page is too high, handle case with warp
        nop
        sw      t1, 0x0000(t0)              // store page (next page)
        b       _end_update                 // don't check multiple page switches per frame
        nop

        _up_warp:
        sw      r0, 0x0000(t0)              //  reset to first page
        b       _end_update                 //  don't check multiple page switches per frame
        nop

        // check for Z press (decrement page)
        _page_down:
        li      a0, Joypad.Z                // a0 - button mask
        li      a2, Joypad.PRESSED          // a2 - type
        jal     Joypad.check_buttons_all_   // v0 = z pressed?
        nop
        beqz    v0, _end                   // if z not pressed, skip
        nop
        li      t0, page_number             // ~
        lw      t1, 0x0000(t0)              // t1 = page number
        beqz    t1, _down_warp              // if page_number == 0, handle special case
        nop
        addiu   t1, t1,-0x0001              // decrement page
        sw      t1, 0x0000(t0)              // store page
        b       _end_update                 // skip _down_warp
        nop

        _down_warp:
        lli     t1, NUM_PAGES - 1           // ~
        sw      t1, 0x0000(t0)              // store page
        b       _end_update
        nop

        _end:
        lw      ra, 0x0004(sp)              // ~
        lw      a0, 0x0008(sp)              // ~
        lw      a1, 0x000C(sp)              // ~
        lw      a2, 0x0010(sp)              // ~
        lw      v0, 0x0014(sp)              // ~
        lw      t0, 0x0018(sp)              // ~
        lw      t1, 0x001C(sp)              // ~
        lw      at, 0x0020(sp)              // restore registers
        addiu   sp, sp, 0x0028              // deallocate stack space
        j       0x801342F4                  // skip (from original line 1)
        nop
        

        _end_update:
        lw      ra, 0x0004(sp)              // ~
        lw      a0, 0x0008(sp)              // ~
        lw      a1, 0x000C(sp)              // ~
        lw      a2, 0x0010(sp)              // ~
        lw      v0, 0x0014(sp)              // ~
        lw      t0, 0x0018(sp)              // ~
        lw      t1, 0x001C(sp)              // ~
        lw      at, 0x0020(sp)              // restore registers
        addiu   sp, sp, 0x0028              // deallocate stack space
        li      a1, 0x80134BD8              // original line 1/2
        lli     t0, 0x0001                  // spoofed cursor id
        sw      t0, 0x0000(a1)              // update cursor id
        j       right_._return              // use right_'s preview update
        nop
    }
    




    // right
    scope right_: {
        OS.patch_start(0x0014FD78, 0x80134208)
        j       right_
        nop
        _return:
        OS.patch_end()

        addiu   sp, sp,-0x0020              // allocate stack space
        sw      t0, 0x0004(sp)              // ~
        sw      t1, 0x0008(sp)              // ~
        sw      at, 0x000C(sp)              // ~
        sw      ra, 0x0010(sp)              // ~
        sw      a0, 0x0014(sp)              // ~
        sw      v0, 0x0018(sp)              // save registers

        li      a1, 0x80134BD8              // original line 1/2
        lli     t0, 0x0001                  // spoofed cursor id
        sw      t0, 0x0000(a1)              // update cursor id

        // check bounds
        li      t0, column                  // ~
        lw      t1, 0x0000(t0)              // t1 = column
        slti    at, t1, NUM_COLUMNS - 1     // if (column < NUM_COLUMNS - 1)
        bnez    at, _normal                 // then go to next colum
        nop

        // update cursor (go to first column)
        sw      r0, 0x0000(t0)              // else go to first column
        b       _end                        // skip to end
        nop

        // update cursor (go right one)
        _normal:
        addi    t1, t1, 0x0001              // t1 = column++
        sw      t1, 0x0000(t0)              // update column

        _end:
        lw      t0, 0x0004(sp)              // ~
        lw      t1, 0x0008(sp)              // ~
        lw      at, 0x000C(sp)              // ~
        lw      ra, 0x0010(sp)              // ~
        lw      a0, 0x0014(sp)              // ~
        lw      v0, 0x0018(sp)              // restore registers
        addiu   sp, sp, 0x0020              // deallocate stack sapce
        j       _return                     // return
        nop


    }

    // left
    scope left_: {
        OS.patch_start(0x0014FC74, 0x80134104)
        j       left_
        nop
        _return:
        OS.patch_end()

        addiu   sp, sp,-0x0018              // allocate stack space
        sw      t0, 0x0004(sp)              // ~
        sw      t1, 0x0008(sp)              // ~
        sw      at, 0x000C(sp)              // ~
        sw      ra, 0x0010(sp)              // ~
        sw      a0, 0x0014(sp)              // save registers

        li      a1, 0x80134BD8              // original line 1/2
        lli     t0, 0x0001                  // spoofed cursor id
        sw      t0, 0x0000(a1)              // update cursor id

        // check bounds
        li      t0, column                  // ~
        lw      t1, 0x0000(t0)              // t1 = column
        bnez    t1, _normal                 // if (!first_column)
        nop

        // update cursor (go to last column)
        lli     t1, NUM_COLUMNS - 1         // ~
        sw      t1, 0x0000(t0)              // else go to last column
        b       _end                        // skip to end
        nop

        // update cursor (go left one)
        _normal:
        addi    t1, t1,-0x0001              // t1 = column--
        sw      t1, 0x0000(t0)              // update column

        _end:
        lw      t0, 0x0004(sp)              // ~
        lw      t1, 0x0008(sp)              // ~
        lw      at, 0x000C(sp)              // ~
        lw      ra, 0x0010(sp)              // ~
        lw      a0, 0x0014(sp)              // restore registers
        addiu   sp, sp, 0x0018              // deallocate stack sapce
        j       _return
        nop
    }


    // down
    scope down_: {
        OS.patch_start(0x0014FBA4, 0x80134034)
        j       down_
        nop
        _return:
        OS.patch_end()

        addiu   sp, sp,-0x0018              // allocate stack space
        sw      t0, 0x0004(sp)              // ~
        sw      t1, 0x0008(sp)              // ~
        sw      at, 0x000C(sp)              // ~
        sw      ra, 0x0010(sp)              // ~
        sw      a0, 0x0014(sp)              // save registers

        lui     v1, 0x8013                  // original line 1
        lli     t0, 0x0001                  // ~ 
        sw      t0, 0x4BD8(v1)              // spoof cursor
        lw      v1, 0x4BD8(v1)              // original line 2

        // check bounds
        li      t0, row                     // ~
        lw      t1, 0x0000(t0)              // t1 = row
        slti    at, t1, NUM_ROWS - 1        // if (row < NUM_ROWS - 1)
        bnez    at, _normal                 // then go to next colum
        nop

        // update cursor (go to first row)
        sw      r0, 0x0000(t0)              // else go to first column
        b       _end                        // skip to end
        nop

        // update cursor (go down one)
        _normal:
        addi    t1, t1, 0x0001              // t1 = row++
        sw      t1, 0x0000(t0)              // update row

        _end:
        lw      t0, 0x0004(sp)              // ~
        lw      t1, 0x0008(sp)              // ~
        lw      at, 0x000C(sp)              // ~
        lw      ra, 0x0010(sp)              // ~
        lw      a0, 0x0014(sp)              // restore registers
        addiu   sp, sp, 0x0018              // deallocate stack sapce
        j       _return
        nop
    }

    // up
    scope up_: {
        OS.patch_start(0x0014FAD0, 0x80133F60)
        j       up_
        nop
        _return:
        OS.patch_end()

        addiu   sp, sp,-0x0018              // allocate stack space
        sw      t0, 0x0004(sp)              // ~
        sw      t1, 0x0008(sp)              // ~
        sw      at, 0x000C(sp)              // ~
        sw      ra, 0x0010(sp)              // ~
        sw      a0, 0x0014(sp)              // save registers

        lui     v1, 0x8013                  // original line 1
        lli     t0, 0x0006                  // ~ 
        sw      t0, 0x4BD8(v1)              // spoof cursor
        lw      v1, 0x4BD8(v1)              // original line 2

        // check bounds
        li      t0, row                     // ~
        lw      t1, 0x0000(t0)              // t1 = row
        bnez    t1, _normal                 // if (!first_row)
        nop

        // update cursor (go to last row)
        lli     t1, NUM_ROWS - 1            // ~
        sw      t1, 0x0000(t0)              // else go to last row
        b       _end                        // skip to end
        nop

        // update cursor (go up one)
        _normal:
        addi    t1, t1,-0x0001              // t1 = row--
        sw      t1, 0x0000(t0)              // update row

        _end:
        lw      t0, 0x0004(sp)              // ~
        lw      t1, 0x0008(sp)              // ~
        lw      at, 0x000C(sp)              // ~
        lw      ra, 0x0010(sp)              // ~
        lw      a0, 0x0014(sp)              // restore registers
        addiu   sp, sp, 0x0018              // deallocate stack sapce
        j       _return
        nop
    }

    // @ Description
    // These patches disable the cursor id from being updated in update_?_ functions.


    // @ Description
    // Adds a stage to the random list if it's toggled on.
    // @ Arguments
    // a0 - address of entry (random stage entry)
    // a1 - stage id to add
    // @ Returns
    // v0 - bool was_added?
    // v1 - num_stages
    scope add_stage_to_random_list_: {
        addiu   sp, sp,-0x0010              // allocate stack sapce
        sw      t0, 0x0004(sp)              // ~
        sw      t1, 0x0008(sp)              // save registers

        // this block checks to see if a stage should be added to the table.
        _check_add:
        lli     v0, OS.FALSE                // v0 = false
        beqz    a0, _continue               // if entry is NULL, add stage
        lli     t0, OS.TRUE                 // set curr_value to true
        lw      t0, 0x0004(a0)              // t0 = curr_value

        _continue:
        li      t1, random_count            // t1 = address of random_count
        lw      v1, 0x0000(t1)              // v1 = random_count
        beqz    t0, _end                    // end, return false and count
        nop

        // if the stage should be added, it is added here. count is also incremented here
        addiu   v1, v1, 0x0001              // v1 = random_count++
        sw      v1, 0x0000(t1)              // update random_count
        li      t0, random_table - 1        // t0 = address of byte before random_table
        addu    t0, t0, v1                  // t0 = random_table + offset
        sb      a1, 0x0000(t0)              // add stage
        lli     v0, OS.TRUE                 // v0 = true

        _end:
        lw      t0, 0x0004(sp)              // ~
        lw      t1, 0x0008(sp)              // restore registers
        addiu   sp, sp, 0x0010              // deallocate stack sapce
        jr      ra                          // return
        nop
    }

    // @ Description
    // Macro to (maybe) add a stage to the random list.
    macro add_to_list(entry, stage_id) {
        li      a0, {entry}                 // a0 - address of entry
        lli     a1, {stage_id}              // a1 - stage id to add
        jal     add_stage_to_random_list_   // add stage
        nop
    }
    
    // @ Description
    // Table of stage IDs
    random_table:
    fill id.MAX_STAGE_ID + 1 - 25           // We don't use the 24 BTT/BTPs nor the RTTF
    OS.align(4)

    // @ Description
    // number of stages in random_table.
    random_count:
    dw 0x00000000

    // @ Description
    // This function fixes a bug that does not allow single player stages to be loaded in training.
    // SSB typically uses *0x800A50E8 to get the stage id. The stage id is then used to find the bg
    // file. This function switches gets a working stage id based on *0x800A50E8 and stores it in
    // expansion memory. That value is read from in three known places
    // TODO: keep an eye out for more uses of this value
    scope training_id_fix_: {
        OS.patch_start(0x001145D0, 0x8018DDB0)
        addiu   sp, sp, 0xFFE8              // original line 3
        sw      ra, 0x0014(sp)              // original line 4
        jal     training_id_fix_
        nop
        OS.patch_end()

        OS.patch_start(0x0011462C, 0x8018DE0C)
        jal     training_id_fix_
        nop
        lui     t5, 0x8019                  // original line 3
        lui     t7, 0x8019                  // original line 4
        lbu     t3, 0x0001(t6)              // original line 5 modified
        OS.patch_end()

        // fix for magnifying glass colour and crashes
        OS.patch_start(0x00114680, 0x8018DE60)
        addiu   sp, sp, 0xFFE8              // original line 3
        sw      ra, 0x0014(sp)              // original line 4
        jal     training_id_fix_
        nop
        lbu     t8, 0x0001(t6)              // original line 5 modified
        OS.patch_end()
        
        addiu   sp, sp,-0x0010              // allocate stack space
        sw      t0, 0x0004(sp)              // ~
        sw      t1, 0x0008(sp)              // ~
        sw      t2, 0x000C(sp)              // save registers

        li      t0, 0x800A50E8              // ~
        lw      t0, 0x0000(t0)              // t0 = dereference 0x800A50E8
        lbu     t0, 0x0001(t0)              // t0 =  stage id
        li      t1, background_table        // t1 = stage id table (offset)
        addu    t1, t1, t0                  // t1 = stage id table + offset
        lbu     t0, 0x0000(t1)              // t0 = new working stage id
        li      t2, id                      // t2 = id
        sb      t0, 0x0000(t2)              // update stage id to working stage id

        lw      t0, 0x0004(sp)              // ~
        lw      t1, 0x0008(sp)              // ~
        lw      t2, 0x000C(sp)              // restore registers
        addiu   sp, sp, 0x0010              // deallocate stack space
        li      t6, id - 1                  // original line 1/2 modified
        jr      ra                          // return
        nop

        id:
        db 0x00                             // holds new stage id
        OS.align(4)
    }

    // @ Description
    // This instruction loads a hardcoded table. That table has been expanded below.
    OS.patch_start(0x00077A9C, 0x800FC29C)
    li      s0, stage_file_table
    OS.patch_end()

    // @ Description
    // These instruction load the start and end of a hardcoded table. That table has been expanded below.
    OS.patch_start(0x14D680, 0x80131B10)
    li      s0, stage_file_table        // start of stage_file_table
    OS.patch_end()
    OS.patch_start(0x14D690, 0x80131B20)
    li      s2, class_table             // start of stage_file_table
    OS.patch_end()

    // @ Description
    // Pointers to the stage tables that are utilized via toggles
    stage_table:
    dw stage_table_normal
    dw stage_table_tournament

    OS.align(16)

    // @ Description
    // Stage IDs in order
    stage_table_normal:
    // page 1 (vanilla and "smash" stages)
    db id.PEACHS_CASTLE                     // 00
    db id.CONGO_JUNGLE                      // 01
    db id.HYRULE_CASTLE                     // 02
    db id.PLANET_ZEBES                      // 03
    db id.MUSHROOM_KINGDOM                  // 04
	db id.META_CRYSTAL                      // 05
    db id.YOSHIS_ISLAND                     // 06
    db id.DREAM_LAND                        // 07
    db id.SECTOR_Z                          // 08
    db id.SAFFRON_CITY                      // 09
    db id.DUEL_ZONE                         // 0A
    db id.FINAL_DESTINATION                 // 0B
    db id.DRAGONKING                        // 0C
    db id.MINI_YOSHIS_ISLAND                // 0D
    db id.FIRST_DESTINATION                 // 0E
    db id.SHOWDOWN                          // 0F
    db id.BATTLEFIELD                       // 10
    db id.RANDOM                            // 11
    // page 2 (original design stages and beta)
    db id.ZLANDING                          // 12
    db id.GANONS_TOWER                      // 13
    db id.SPIRALM                           // 14
    db id.COOLCOOL                          // 15
    db id.DR_MARIO                          // 16
    db id.BOWSERB                           // 17
    db id.N64                               // 18
    db id.DEKU_TREE                         // 19
    db id.MADMM                             // 1A
    db id.MUDA			                    // 1B
    db id.MUTE                              // 1C
    db id.KITCHEN                           // 1D
    db id.FROSTY                            // 1E
    db id.FRAYS_STAGE                       // 1F
    db id.DREAM_LAND_BETA_1                 // 20
    db id.DREAM_LAND_BETA_2                 // 21
    db id.HOW_TO_PLAY                       // 22
    db id.RANDOM                            // 23
    // page 3 (guest stages)
    db id.WARIOWARE                         // 24
    db id.KALOS_POKEMON_LEAGUE              // 25
    db id.POKEMON_STADIUM_2                 // 26
    db id.SKYLOFT                           // 27
    db id.SMASHVILLE2                       // 28
    db id.MEMENTOS                          // 29
    db id.CORNERIACITY                     	// 2A
    db id.GREAT_BAY                         // 2B
    db id.FOD					            // 2C
    db id.TOH                               // 2D
    db id.SMBBF                             // 2E
    db id.SMBO                              // 2F
    db id.DELFINO                           // 30
    db id.PEACH2                            // 31
    db id.CORNERIA2                         // 32
    db id.BLUE					            // 33
    db id.ONETT                             // 34
    db id.RANDOM                            // 35
    // page 4 (more stages)
    db id.GLACIAL                           // 36
    db id.HTEMPLE                           // 37
    db id.NPC                               // 38
    db id.SMASHKETBALL                      // 39
    db id.NORFAIR                           // 3A
    db id.FALLS                             // 3C
	db id.FLAT_ZONE							// 3B
    db id.FLAT_ZONE_2                       // 40   
    db id.OSOHE                             // 3D
    db id.YOSHI_STORY_2                     // 3E
    db id.GERUDO                            // 41
    db id.RANDOM                            // 42
    db id.RANDOM                            // 43
    db id.RANDOM                            // 44
    db id.RANDOM                            // 45
    db id.RANDOM                            // 46
    db id.RANDOM                            // 47
	db id.RANDOM                            // 47

    OS.align(16)

    // @ Description
    // Stage IDs in order
    stage_table_tournament:
    // page 1 (vanilla and "smash" stages)
    // Page 1 - Viable
    db id.DREAM_LAND                        // 00
    db id.ZLANDING                          // 01
    db id.DEKU_TREE                         // 02
    db id.FRAYS_STAGE                       // 03
    db id.POKEMON_STADIUM_2                 // 04
	db id.KALOS_POKEMON_LEAGUE              // 25
    db id.SPIRALM                           // 14
    db id.TOH                               // 2D
    db id.MUTE                              // 1C
    db id.SMBBF                             // 2E
    db id.BATTLEFIELD                       // 10
    db id.WARIOWARE                         // 24
    db id.FIRST_DESTINATION                 // 0E
    db id.GERUDO                            // 2F
    db id.GLACIAL                           // 35
    db id.DR_MARIO                          // 16
    db id.SMASHVILLE2                       // 28
    db id.RANDOM                            // 0D
    // Page 2 - Semi-Viable
    db id.SMBO                              // 2F
	db id.YOSHI_STORY_2						// 23
	db id.NPC                       		// 28
	db id.MINI_YOSHIS_ISLAND                // 0D
    db id.BOWSERB                           // 17
	db id.FINAL_DESTINATION                 // 0B
    db id.CORNERIACITY                      // 2A
    db id.GANONS_TOWER                      // 13
	db id.SKYLOFT                           // 27
    db id.DELFINO                           // 30
    db id.META_CRYSTAL                      // 05
    db id.PEACHS_CASTLE                     // 00
    db id.CONGO_JUNGLE                      // 01
    db id.HYRULE_CASTLE                     // 26
    db id.FOD					            // 2C
    db id.MEMENTOS                          // 29
    db id.DUEL_ZONE                         // 0A
    db id.YOSHIS_ISLAND                     // 06
    db id.RANDOM                            // 0
    // Page 3 - Non-Viable
	db id.FALLS                     		// 06
	db id.FLAT_ZONE_2                     	// 06
	db id.FLAT_ZONE                     	// 06
	db id.MUDA			                    // 1B
	db id.SAFFRON_CITY                      // 09
    db id.CORNERIA2                         // 32
    db id.COOLCOOL                          // 15
    db id.GREAT_BAY                         // 2B
    db id.SECTOR_Z                          // 08
    db id.N64                               // 18
    db id.HTEMPLE                           // 18
    db id.MADMM                             // 1A
    db id.KITCHEN                           // 1D
    db id.FROSTY                            // 1E
	db id.NORFAIR                      		// 1E
    db id.PLANET_ZEBES                      // 1E
    db id.RANDOM                            // 0
    // Page 4 - Non-Viable
    db id.PEACH2                            // 31
	db id.OSOHE                     		// 06
	db id.MUSHROOM_KINGDOM                  // 04
	db id.BLUE					            // 33
	db id.DRAGONKING                        // 0C
	db id.SHOWDOWN                          // 0F
	db id.ONETT                             // 34
	db id.SMASHKETBALL                      // 0
    db id.DREAM_LAND_BETA_1                 // 20
    db id.DREAM_LAND_BETA_2                 // 21
    db id.HOW_TO_PLAY                       // 22
    db id.RANDOM                            // 0
    db id.RANDOM                            // 0
    db id.RANDOM                            // 0
    db id.RANDOM                            // 0
    db id.RANDOM                            // 0
    db id.RANDOM                            // 0
    db id.RANDOM                            // 0
    OS.align(4)

    // @ Description
    // Coordinates of stage icons in vanilla Super Smash Bros.
    position_table:
    // row 0
    dw 033, 020                             // 00
    dw 075, 020                             // 01
    dw 117, 020                             // 02
    dw 159, 020                             // 03
    dw 201, 020                             // 04
    dw 243, 020                             // 05

    // row 1
    dw 033, 052                             // 06
    dw 075, 052                             // 07
    dw 117, 052                             // 08
    dw 159, 052                             // 09
    dw 201, 052                             // 0A
    dw 243, 052                             // 0B

    // row 2
    dw 033, 084                             // 0C
    dw 075, 084                             // 0D
    dw 117, 084                             // 0E
    dw 159, 084                             // 0F
    dw 201, 084                             // 10
    dw 243, 084                             // 11

    // something something function funciton
    function_table:
    dw function.PEACHS_CASTLE
    dw function.SECTOR_Z
    dw function.CONGO_JUNGLE
    dw function.PLANET_ZEBES
    dw function.HYRULE_CASTLE
    dw function.YOSHIS_ISLAND
    dw function.DREAM_LAND
    dw function.SAFFRON_CITY
    dw function.MUSHROOM_KINGDOM

    dw OS.NULL                              // (handled elsewhere)
    dw OS.NULL                              // (handled elsewhere)
    dw OS.NULL                              // (handled elsewhere)
    dw OS.NULL                              // (handled elsewhere)
    dw OS.NULL                              // (handled elsewhere)
    dw OS.NULL                              // (handled elsewhere)
    dw OS.NULL                              // (handled elsewhere)
    dw OS.NULL                              // (handled elsewhere)
    dw OS.NULL                              // (handled elsewhere)
    dw OS.NULL                              // (handled elsewhere)
    dw OS.NULL                              // (handled elsewhere)
    dw OS.NULL                              // (handled elsewhere)
    dw OS.NULL                              // (handled elsewhere)
    dw OS.NULL                              // (handled elsewhere)
    dw OS.NULL                              // (handled elsewhere)
    dw OS.NULL                              // (handled elsewhere)
    dw OS.NULL                              // (handled elsewhere)
    dw OS.NULL                              // (handled elsewhere)
    dw OS.NULL                              // (handled elsewhere)
    dw OS.NULL                              // (handled elsewhere)
    dw OS.NULL                              // (handled elsewhere)
    dw OS.NULL                              // (handled elsewhere)
    dw OS.NULL                              // (handled elsewhere)
    dw OS.NULL                              // (handled elsewhere)
    dw OS.NULL                              // (handled elsewhere)
    dw OS.NULL                              // (handled elsewhere)
    dw OS.NULL                              // (handled elsewhere)
    dw OS.NULL                              // (handled elsewhere)
    dw OS.NULL                              // (handled elsewhere)
    dw OS.NULL                              // (handled elsewhere)
    dw OS.NULL                              // (handled elsewhere)
    dw OS.NULL                              // (handled elsewhere)

    dw function.CLONE                       // Deku Tree
    dw function.CLONE                       // First Destination
    dw function.CLONE                       // Ganon's Tower
    dw function.CLONE                       // Kalos Pokemon League
    dw function.CLONE                       // Pokemon Stadium
    dw function.CLONE                       // Skyloft
    dw function.CLONE                       // Glacial River
    dw function.CLONE                       // WarioWare
    dw function.CLONE                       // Battlefield
    dw function.CLONE                       // Flat Zone
    dw function.CLONE                       // Dr. Mario
    dw function.CLONE                       // Cool Cool Mountain
    dw function.CLONE                       // Dragon King
    dw function.CONGO_JUNGLE                // Great Bay
    dw function.CLONE                       // Fray' Stage
    dw function.CLONE                       // Tower of Heaven
	dw function.CONGO_JUNGLE                // Fountain of Dreams
    dw function.CLONE                       // Muda Kingdom
    dw function.CLONE                       // Mementos
    dw function.CLONE                       // Showdown
    dw function.CLONE                       // Spiral Mountain
    dw function.CLONE                       // N64
    dw function.CLONE                       // Mute City
    dw function.CLONE                       // Mad Monster Mansion
    dw function.CLONE                       // SMBBF
    dw function.CLONE                       // SMBO
    dw function.PEACHS_CASTLE               // Bowser's Stadium
    dw function.CLONE                       // Peach's Castle II
    dw function.CLONE                       // Delfino
    dw function.CLONE                       // Corneria
    dw function.PEACHS_CASTLE               // Kitchen Island
    dw function.PEACHS_CASTLE               // Big Blue
    dw function.CONGO_JUNGLE                // Onett
    dw function.CLONE                       // Zebes Landing
    dw function.CLONE                       // Frosty Village
    dw function.PEACHS_CASTLE               // Smashville
    dw OS.NULL                              // Dr. Mario Break the Targets
    dw OS.NULL                              // Ganondorf Break the Targets
    dw OS.NULL                              // Young Link Break the Targets
    dw function.CLONE                       // Great Bay SSS
    dw OS.NULL                              // Dark Samus Break the Targets
    dw OS.NULL                              // Stage 1 Break the Targets
    dw OS.NULL                              // Falco Break the Targets
    dw OS.NULL                              // Wario Break the Targets
    dw function.CLONE                       // Hyrule Temple
    dw OS.NULL                              // Lucas Break the Targets
    dw OS.NULL                              // Ganondorf Board the Platforms
    dw function.CLONE                       // New Pork City
    dw OS.NULL                              // Dark Samus Board the Platforms
    dw function.CONGO_JUNGLE                // Smashketball
	dw OS.NULL                              // Dr. Mario Board the Platforms
	dw function.PLANET_ZEBES                // Norfair
	dw function.SECTOR_Z					// Corneria City
	dw function.CONGO_JUNGLE			    // Congo Falls
	dw function.CLONE                       // OSOHE
	dw function.PEACHS_CASTLE               // Yoshi's Story II
	dw function.PEACHS_CASTLE               // World 1-1
	dw function.PEACHS_CASTLE               // Flat Zone II
	dw function.CLONE                       // Gerudo Valley
	dw OS.NULL                              // Young Link Board the Platforms

    // @ Description
    // Textures for the SSS icons

    // default stages
    insert icon_peachs_castle,          "../textures/icon_peachs_castle.rgba5551"
    insert icon_sector_z,               "../textures/icon_sector_z.rgba5551"
    insert icon_congo_jungle,           "../textures/icon_congo_jungle.rgba5551"
    insert icon_planet_zebes,           "../textures/icon_planet_zebes.rgba5551"
    insert icon_hyrule_castle,          "../textures/icon_hyrule_castle.rgba5551"
    insert icon_yoshis_island,          "../textures/icon_yoshis_island.rgba5551"
    insert icon_dream_land,             "../textures/icon_dream_land.rgba5551"
    insert icon_saffron_city,           "../textures/icon_saffron_city.rgba5551"
    insert icon_mushroom_kingdom,       "../textures/icon_mushroom_kingdom.rgba5551"
    insert icon_dream_land_beta_1,      "../textures/icon_dream_land_beta_1.rgba5551"
    insert icon_dream_land_beta_2,      "../textures/icon_dream_land_beta_2.rgba5551"
    insert icon_how_to_play,            "../textures/icon_how_to_play.rgba5551"
    insert icon_mini_yoshis_island,     "../textures/icon_yoshis_island.rgba5551"
    insert icon_meta_crystal,           "../textures/icon_meta_crystal.rgba5551"
    insert icon_duel_zone,              "../textures/icon_duel_zone.rgba5551"
    insert icon_final_destination,      "../textures/icon_final_destination.rgba5551"
    insert icon_random,                 "../textures/icon_random.rgba5551"
    insert icon_btx,                    "../textures/icon_btx.rgba5551"

    // new stages
    insert icon_deku_tree,              "../textures/icon_deku_tree.rgba5551"
    insert icon_first_destination,      "../textures/icon_first_destination.rgba5551"
    insert icon_ganons_tower,           "../textures/icon_ganons_tower.rgba5551"
    insert icon_kalos_pokemon_league,   "../textures/icon_kalos_pokemon_league.rgba5551"
    insert icon_pokemon_stadium_2,      "../textures/icon_pokemon_stadium_2.rgba5551"
    insert icon_skyloft,                "../textures/icon_skyloft.rgba5551"
    insert icon_glacial,                "../textures/icon_glacial.rgba5551"
    insert icon_warioware,              "../textures/icon_warioware.rgba5551"
    insert icon_battlefield,            "../textures/icon_battlefield.rgba5551"
    insert icon_corneria_city,          "../textures/icon_corneria_city.rgba5551"
    insert icon_dr_mario,               "../textures/icon_dr_mario.rgba5551"
    insert icon_cool_cool_mountain,     "../textures/icon_cool_cool_mountain.rgba5551"
    insert icon_dragon_king,            "../textures/icon_dragon_king.rgba5551"
    insert icon_great_bay,              "../textures/icon_great_bay.rgba5551"
    insert icon_frays_stage,            "../textures/icon_frays_stage.rgba5551"
    insert icon_toh,                    "../textures/icon_toh.rgba5551"
	insert icon_fod,					"../textures/icon_fod.rgba5551"
    insert icon_muda,                   "../textures/icon_muda.rgba5551"
    insert icon_mementos,               "../textures/icon_mementos.rgba5551"
    insert icon_showdown,               "../textures/icon_showdown.rgba5551"
    insert icon_spiralm,                "../textures/icon_spiralm.rgba5551"
    insert icon_n64,                    "../textures/icon_n64.rgba5551"
    insert icon_mute,                   "../textures/icon_mute.rgba5551"
    insert icon_madmm,                  "../textures/icon_madmm.rgba5551"
    insert icon_smbbf,                  "../textures/icon_smbbf.rgba5551"
    insert icon_smbo,                   "../textures/icon_smbo.rgba5551"
    insert icon_bowserb,                "../textures/icon_bowserb.rgba5551"
    insert icon_peach2,                 "../textures/icon_peach2.rgba5551"
    insert icon_delfino,                "../textures/icon_delfino.rgba5551"
    insert icon_corneria2,              "../textures/icon_corneria2.rgba5551"
    insert icon_kitchen,                "../textures/icon_kitchen.rgba5551"
    insert icon_blue,                   "../textures/icon_blue.rgba5551"
    insert icon_onett,                  "../textures/icon_onett.rgba5551"
    insert icon_zlanding,               "../textures/icon_zlanding.rgba5551"
    insert icon_frosty,                 "../textures/icon_frosty.rgba5551"
    insert icon_smashville2,            "../textures/icon_smashville.rgba5551"
    insert icon_falls,                  "../textures/icon_falls.rgba5551"
    insert icon_hyrule_temple,          "../textures/icon_hyrule_temple.rgba5551"
    insert icon_npc,                    "../textures/icon_npc.rgba5551"
    insert icon_smashketball,           "../textures/icon_smashketball.rgba5551"
	insert icon_norfair,           		"../textures/icon_norfair.rgba5551"
	insert icon_flat_zone,           	"../textures/icon_flat_zone.rgba5551"
	insert icon_osohe,           		"../textures/icon_osohe.rgba5551"
	insert icon_yoshi_story_2,          "../textures/icon_yoshi_story_2.rgba5551"
	insert icon_world1,          		"../textures/icon_world1.rgba5551"
	insert icon_flat_zone_2,          	"../textures/icon_flat_zone_2.rgba5551"
	insert icon_gerudo,          	    "../textures/icon_gerudo.rgba5551"
	

    // sorted by stage id
    icon_table:
    dw icon_peachs_castle                   // Peach's Castle
    dw icon_sector_z                        // Sector Z
    dw icon_congo_jungle                    // Congo Jungle
    dw icon_planet_zebes                    // Planet Zebes
    dw icon_hyrule_castle                   // Hyrule Castle
    dw icon_yoshis_island                   // Yoshi's Island
    dw icon_dream_land                      // Dream Land
    dw icon_saffron_city                    // Saffron City
    dw icon_mushroom_kingdom                // Mushroom Kingdom
    dw icon_dream_land_beta_1               // Dream Land Beta 1
    dw icon_dream_land_beta_2               // Dream Land Beta 2
    dw icon_how_to_play                     // How to Play
    dw icon_mini_yoshis_island              // Mini Yoshi's Island
    dw icon_meta_crystal                    // Meta Crystal
    dw icon_duel_zone                       // Duel Zone
    dw icon_btx                             // Race to the Finish
    dw icon_final_destination               // Final Destination
    dw icon_btx                             // BTT Mario
    dw icon_btx                             // BTT Fox
    dw icon_btx                             // BTT DK
    dw icon_btx                             // BTT Samus
    dw icon_btx                             // BTT Luigi
    dw icon_btx                             // BTT Link
    dw icon_btx                             // BTT Yoshi
    dw icon_btx                             // BTT Falcon
    dw icon_btx                             // BTT Kirby
    dw icon_btx                             // BTT Pikachu
    dw icon_btx                             // BTT Jigglypuff
    dw icon_btx                             // BTT Ness
    dw icon_btx                             // BTP Mario
    dw icon_btx                             // BTP Fox
    dw icon_btx                             // BTP DK
    dw icon_btx                             // BTP Samus
    dw icon_btx                             // BTP Luigi
    dw icon_btx                             // BTP Link
    dw icon_btx                             // BTP Yoshi
    dw icon_btx                             // BTP Falcon
    dw icon_btx                             // BTP Kirby
    dw icon_btx                             // BTP Pikachu
    dw icon_btx                             // BTP Jigglypuff
    dw icon_btx                             // BTP Ness
    dw icon_deku_tree                       // Deku Tree
    dw icon_first_destination               // First Destination
    dw icon_ganons_tower                    // Ganon's Tower
    dw icon_kalos_pokemon_league            // Kalos Pokemon League
    dw icon_pokemon_stadium_2               // Pokemon Stadium 2
    dw icon_skyloft                         // Skyloft
    dw icon_glacial                         // Glacial River
    dw icon_warioware                       // WarioWare
    dw icon_battlefield                     // Batlefield
    dw icon_flat_zone	                    // Flat Zone
    dw icon_dr_mario                        // Dr. Mario
    dw icon_cool_cool_mountain              // Cool Cool Mountain
    dw icon_dragon_king                     // Dragon King
    dw icon_great_bay                       // Great Bay
    dw icon_frays_stage                     // Fray's Stage
    dw icon_toh                             // Tower of Heaven
	dw icon_fod								// Fountain of Dreams
    dw icon_muda                            // Muda Kingdom
    dw icon_mementos                        // Mementos
    dw icon_showdown                        // Showdown
    dw icon_spiralm                         // Spiral Mountain
    dw icon_n64                             // N64
    dw icon_mute                            // Mute City
    dw icon_madmm                           // Mad Monster Mansion
    dw icon_smbbf                           // Mushroom Kingdom BF
    dw icon_smbo                            // Mushroom Kingdom Omega
    dw icon_bowserb                         // Bowser's Stadium
    dw icon_peach2                          // Peach's Castle II
    dw icon_delfino                         // Delfino Plaza
    dw icon_corneria2                       // Corneria
    dw icon_kitchen                         // Kitchen Island
    dw icon_blue                            // Big Blue
    dw icon_onett                           // Onett
    dw icon_zlanding                        // Zebes Landing
    dw icon_frosty                          // Frosty Village
    dw icon_smashville2                     // Smashville
    dw icon_btx                             // BTT Dr. Mario
    dw icon_btx                             // BTT Ganondorf
    dw icon_btx                             // BTT Young Link
    dw icon_great_bay                       // Great Bay SSS
    dw icon_btx                             // BTT Dark Samus
    dw icon_btx                             // BTT Stage 1
    dw icon_btx                             // BTT Falco
    dw icon_btx                             // BTT Wario
    dw icon_hyrule_temple                   // Hyrule Temple
    dw icon_btx                             // BTT Lucas
    dw icon_btx                             // BTP Ganondorf
    dw icon_npc                             // New Pork City
    dw icon_btx                             // BTP Dark Samus
    dw icon_smashketball                    // Smashketball
	dw icon_btx                             // BTP Dr. Mario
	dw icon_norfair                         // Norfair
	dw icon_corneria_city                   // Corneria City
	dw icon_falls                   		// Congo Falls
	dw icon_osohe                   		// Osohe
	dw icon_yoshi_story_2                   // Yoshi's Story II
	dw icon_world1		                    // World 1-1
	dw icon_flat_zone_2                   	// Flat Zone II
	dw icon_gerudo		                    // Gerudo Valley
	dw icon_btx                             // BTP Young Link

    // @ Description
    // Row the cursor is on
    row:
    dw 0

    // @ Description
    // column the cursor is on
    column:
    dw 0

    // @ Description
    // Page number for the CSS
    page_number:
    dw 0x00000000

    zoom_table:
    float32 0.4                         // Peach's Castle
    float32 0.2                         // Sector Z
    float32 0.5                         // Congo Jungle
    float32 0.4                         // Planet Zebes
    float32 0.3                         // Hyrule Castle
    float32 0.5                         // Yoshi's Island
    float32 0.4                         // Dream Land
    float32 0.4                         // Saffron City
    float32 0.2                         // Mushroom Kingdom
    float32 0.5                         // Dream Land Beta 1
    float32 0.3                         // Dream Land Beta 2
    float32 0.5                         // How to Play
    float32 0.5                         // Mini Yoshi's Island
    float32 0.5                         // Meta Crystal
    float32 0.5                         // Duel Zone
    float32 0.5                         // Race to the Finish (Placeholder)
    float32 0.5                         // Final Deestination
    float32 0.5                         // BTT Mario
    float32 0.5                         // BTT Fox
    float32 0.5                         // BTT DK
    float32 0.5                         // BTT Samus
    float32 0.5                         // BTT Luigi
    float32 0.5                         // BTT Link
    float32 0.5                         // BTT Yoshi
    float32 0.5                         // BTT Falcon
    float32 0.5                         // BTT Kirby
    float32 0.5                         // BTT Pikachu
    float32 0.5                         // BTT Jigglypuff
    float32 0.5                         // BTT Ness
    float32 0.5                         // BTP Mario
    float32 0.5                         // BTP Fox
    float32 0.5                         // BTP DK
    float32 0.5                         // BTP Samus
    float32 0.5                         // BTP Luigi
    float32 0.5                         // BTP Link
    float32 0.5                         // BTP Yoshi
    float32 0.5                         // BTP Falcon
    float32 0.5                         // BTP Kirby
    float32 0.5                         // BTP Pikachu
    float32 0.5                         // BTP Jigglypuff
    float32 0.5                         // BTP Ness
    float32 0.5                         // Deku Tree
    float32 0.5                         // First Destination
    float32 0.3                         // Ganon's Tower
    float32 0.5                         // Kalos Pokemon League
    float32 0.5                         // Pokemon Stadium
    float32 0.5                         // Skyloft
    float32 0.5                         // Glacial River
    float32 0.5                         // WarioWare
    float32 0.5                         // Battlefield
    float32 0.3                         // Flat Zone
    float32 0.5                         // Dr. Mario
    float32 0.5                         // Cool Cool Mountain
    float32 0.5                         // Dragon King
    float32 0.5                         // Great Bay
    float32 0.5                         // Fray's Stage
    float32 0.5                         // Tower of Heaven
	float32 0.5							// Fountain of Dreams
    float32 0.5                         // Muda Kingdom
    float32 0.5                         // Mementos
    float32 0.5                         // Showdown
    float32 0.5                         // Spiral Mountain
    float32 0.5                         // N64
    float32 0.5                         // Mute City
    float32 0.5                         // Mad Monster Mansion
    float32 0.5                         // Mushroom Kingdom BF
    float32 0.5                         // Mushroom Kingdom Omega
    float32 0.5                         // Bowser's Stadium
    float32 0.5                         // Peach's Castle II
    float32 0.5                         // Delfino Plaza
    float32 0.5                         // Corneria
    float32 0.5                         // Uncanny Mansion
    float32 0.5                         // Big Blue
    float32 0.5                         // Onett
    float32 0.5                         // Zebes Landing
    float32 0.5                         // Frosty Village
    float32 0.5                         // Smashville
    float32 0.5                         // BTT Dr. Mario
    float32 0.5                         // BTT Ganondorf
    float32 0.5                         // BTT Young Link
    float32 0.5                         // Great Bay SSS
    float32 0.5                         // BTT Dark Samus
    float32 0.5                         // BTT Stage 1
    float32 0.5                         // BTT Falco
    float32 0.5                         // BTT Wario
    float32 0.2                         // Hyrule Temple
    float32 0.5                         // BTT Lucas
    float32 0.5                         // BTP Ganondorf
    float32 0.5                         // New Pork City
    float32 0.5                         // BTP Dark Samus
    float32 0.5                         // Smashketball
	float32 0.5                         // BTP Dr. Mario
	float32 0.5                         // Norfair
	float32 0.5                         // Corneria City
	float32 0.5                         // Congo Falls
	float32 0.2                         // Osohe
	float32 0.5                         // Yoshi's Island II
	float32 0.2                         // World 1-1
	float32 0.2                         // Flat Zone II
	float32 0.5                         // Gerudo Valley
	float32 0.5                         // Young Link Board the Platforms

    background_table:
    db id.PEACHS_CASTLE                 // Peach's Castle
    db id.SECTOR_Z                      // Sector Z
    db id.CONGO_JUNGLE                  // Congo Jungle
    db id.PLANET_ZEBES                  // Planet Zebes
    db id.HYRULE_CASTLE                 // Hyrule Castle
    db id.YOSHIS_ISLAND                 // Yoshi's Island
    db id.DREAM_LAND                    // Dream Land
    db id.SAFFRON_CITY                  // Saffron City
    db id.MUSHROOM_KINGDOM              // Mushroom Kingdom
    db id.DREAM_LAND                    // Dream Land Beta 1
    db id.DREAM_LAND                    // Dream Land Beta 2
    db id.DREAM_LAND                    // How to Play
    db id.YOSHIS_ISLAND                 // Yoshi's Island (1P)
    db id.SECTOR_Z                      // Meta Crystal
    db id.SECTOR_Z                      // Batlefield
    db id.SECTOR_Z                      // Race to the Finish (Placeholder)
    db id.SECTOR_Z                      // Final Destination
    db id.SECTOR_Z                      // BTT Mario
    db id.SECTOR_Z                      // BTT Fox
    db id.SECTOR_Z                      // BTT DK
    db id.SECTOR_Z                      // BTT Samus
    db id.SECTOR_Z                      // BTT Luigi
    db id.SECTOR_Z                      // BTT Link
    db id.SECTOR_Z                      // BTT Yoshi
    db id.SECTOR_Z                      // BTT Falcon
    db id.SECTOR_Z                      // BTT Kirby
    db id.SECTOR_Z                      // BTT Pikachu
    db id.SECTOR_Z                      // BTT Jigglypuff
    db id.SECTOR_Z                      // BTT Ness
    db id.SECTOR_Z                      // BTP Mario
    db id.SECTOR_Z                      // BTP Fox
    db id.SECTOR_Z                      // BTP DK
    db id.SECTOR_Z                      // BTP Samus
    db id.SECTOR_Z                      // BTP Luigi
    db id.SECTOR_Z                      // BTP Link
    db id.SECTOR_Z                      // BTP Yoshi
    db id.SECTOR_Z                      // BTP Falcon
    db id.SECTOR_Z                      // BTP Kirby
    db id.SECTOR_Z                      // BTP Pikachu
    db id.SECTOR_Z                      // BTP Jigglypuff
    db id.SECTOR_Z                      // BTP Ness
    db id.YOSHIS_ISLAND                 // Deku Tree
    db id.PEACHS_CASTLE                 // First Destination
    db id.SECTOR_Z                      // Ganon's Tower
    db id.SECTOR_Z                      // Kalos Pokemon League
    db id.SECTOR_Z                      // Pokemon Stadium
    db id.PEACHS_CASTLE                 // Skyloft
    db id.PEACHS_CASTLE                 // Glacial River
    db id.SECTOR_Z                      // WarioWare
    db id.PEACHS_CASTLE                 // Battlefield
    db id.SECTOR_Z	                    // Flat Zone
    db id.YOSHIS_ISLAND                 // Dr. Mario
    db id.PEACHS_CASTLE                 // Cool Cool Mountain
    db id.PEACHS_CASTLE                 // Dragon King
    db id.PEACHS_CASTLE                 // Great Bay
    db id.YOSHIS_ISLAND                 // Fray's Stage
    db id.SECTOR_Z                      // Tower of Heaven
	db id.SECTOR_Z						// Fountain of Dreams
    db id.YOSHIS_ISLAND                 // Muda Kingdom
    db id.SECTOR_Z                      // Mementos
    db id.SECTOR_Z                      // Showdown
    db id.PEACHS_CASTLE                 // Spiral Mountain
    db id.PEACHS_CASTLE                 // N64
    db id.PEACHS_CASTLE                 // Mute City
    db id.SECTOR_Z                      // Mad Monster Mansion
    db id.MUSHROOM_KINGDOM              // Mushroom Kingdom BF
    db id.MUSHROOM_KINGDOM              // Mushroom Kingdom Omega
    db id.SECTOR_Z                      // Bowser's Stadium
    db id.PEACHS_CASTLE                 // Peach's Castle II
    db id.PEACHS_CASTLE                 // Delfino Plaza
    db id.PEACHS_CASTLE                 // Corneria
    db id.PEACHS_CASTLE                 // Kitchen Island
    db id.PEACHS_CASTLE                 // Big Blue
    db id.PEACHS_CASTLE                 // Onett
    db id.SECTOR_Z                      // Zebes Landing
    db id.SECTOR_Z                      // Frosty Village
    db id.PEACHS_CASTLE                 // Smashville
    db id.SECTOR_Z                      // BTT Dr. Mario
    db id.SECTOR_Z                      // BTT Ganondorf
    db id.PEACHS_CASTLE                 // BTT Young Link
    db id.PEACHS_CASTLE                 // Great Bay SSS
    db id.SECTOR_Z                      // BTT Dark Samus
    db id.SECTOR_Z                      // BTT Stage 1
    db id.SECTOR_Z                      // BTT Falco
    db id.SECTOR_Z                      // BTT Wario
    db id.PEACHS_CASTLE                 // Hyrule Temple
    db id.SECTOR_Z                      // BTT Lucas
    db id.SECTOR_Z                      // BTP Ganondorf
    db id.SECTOR_Z                      // New Pork City
    db id.SECTOR_Z                      // BTP Dark Samus
    db id.SECTOR_Z                      // Smashketball
	db id.SECTOR_Z                      // BTP Dr. Mario
	db id.SECTOR_Z                      // Norfair
	db id.PEACHS_CASTLE                 // Corneria City
	db id.PEACHS_CASTLE                 // Congo Falls
	db id.PEACHS_CASTLE                 // Osohe
	db id.PEACHS_CASTLE                 // Yoshi's Island II
	db id.PEACHS_CASTLE                 // World 1-1
	db id.SECTOR_Z                      // Flat Zone II
	db id.YOSHIS_ISLAND                 // Gerudo Valley
	db id.SECTOR_Z                      // Young Link Board the Platforms
    OS.align(4)

    stage_file_table:
    // header file, type
    dw header.PEACHS_CASTLE,          type.PEACHS_CASTLE
    dw header.SECTOR_Z,               type.SECTOR_Z
    dw header.CONGO_JUNGLE,           type.CONGO_JUNGLE
    dw header.PLANET_ZEBES,           type.PLANET_ZEBES
    dw header.HYRULE_CASTLE,          type.HYRULE_CASTLE
    dw header.YOSHIS_ISLAND,          type.YOSHIS_ISLAND
    dw header.DREAM_LAND,             type.DREAM_LAND
    dw header.SAFFRON_CITY,           type.SAFFRON_CITY
    dw header.MUSHROOM_KINGDOM,       type.MUSHROOM_KINGDOM
    dw header.DREAM_LAND_BETA_1,      type.DREAM_LAND_BETA_1
    dw header.DREAM_LAND_BETA_2,      type.DREAM_LAND_BETA_2
    dw header.HOW_TO_PLAY,            type.HOW_TO_PLAY
    dw header.MINI_YOSHIS_ISLAND,     type.MINI_YOSHIS_ISLAND
    dw header.META_CRYSTAL,           type.META_CRYSTAL
    dw header.DUEL_ZONE,              type.DUEL_ZONE
    dw header.RACE_TO_THE_FINISH,     type.RACE_TO_THE_FINISH
    dw header.FINAL_DESTINATION,      type.FINAL_DESTINATION
    dw header.BTT_MARIO,              type.BTT
    dw header.BTT_FOX,                type.BTT
    dw header.BTT_DONKEY_KONG,        type.BTT
    dw header.BTT_SAMUS,              type.BTT
    dw header.BTT_LUIGI,              type.BTT
    dw header.BTT_LINK,               type.BTT
    dw header.BTT_YOSHI,              type.BTT
    dw header.BTT_FALCON,             type.BTT
    dw header.BTT_KIRBY,              type.BTT
    dw header.BTT_PIKACHU,            type.BTT
    dw header.BTT_JIGGLYPUFF,         type.BTT
    dw header.BTT_NESS,               type.BTT
    dw header.BTP_MARIO,              type.BTP
    dw header.BTP_FOX,                type.BTP
    dw header.BTP_DONKEY_KONG,        type.BTP
    dw header.BTP_SAMUS,              type.BTP
    dw header.BTP_LUIGI,              type.BTP
    dw header.BTP_LINK,               type.BTP
    dw header.BTP_YOSHI,              type.BTP
    dw header.BTP_FALCON,             type.BTP
    dw header.BTP_KIRBY,              type.BTP
    dw header.BTP_PIKACHU,            type.BTP
    dw header.BTP_JIGGLYPUFF,         type.BTP
    dw header.BTP_NESS,               type.BTP
    dw header.DEKU_TREE,              type.CLONE
    dw header.FIRST_DESTINATION,      type.CLONE
    dw header.GANONS_TOWER,           type.CLONE
    dw header.KALOS_POKEMON_LEAGUE,   type.CLONE
    dw header.POKEMON_STADIUM_2,      type.CLONE
    dw header.SKYLOFT,                type.CLONE
    dw header.GLACIAL,                type.CLONE
    dw header.WARIOWARE,              type.CLONE
    dw header.BATTLEFIELD,            type.CLONE
    dw header.FLAT_ZONE,              type.CLONE
    dw header.DR_MARIO,               type.CLONE
    dw header.COOLCOOL,               type.CLONE
    dw header.DRAGONKING,             type.CLONE
    dw header.GREAT_BAY,              type.CONGO_JUNGLE
    dw header.FRAYS_STAGE,            type.CLONE
    dw header.TOH,                    type.CLONE
	dw header.FOD,					  type.CONGO_JUNGLE
    dw header.MUDA,                   type.CLONE
    dw header.MEMENTOS,               type.CLONE
    dw header.SHOWDOWN,               type.CLONE
    dw header.SPIRALM,                type.CLONE
    dw header.N64,                    type.CLONE
    dw header.MUTE,                   type.CLONE
    dw header.MADMM,                  type.CLONE
    dw header.SMBBF,                  type.CLONE
    dw header.SMBO,                   type.CLONE
    dw header.BOWSERB,                type.CLONE
    dw header.PEACH2,                 type.CLONE
    dw header.DELFINO,                type.CLONE
    dw header.CORNERIA2,              type.CLONE
    dw header.KITCHEN,                type.PEACHS_CASTLE
    dw header.BLUE,                   type.PEACHS_CASTLE
    dw header.ONETT,                  type.CONGO_JUNGLE
    dw header.ZLANDING,               type.CLONE
    dw header.FROSTY,                 type.CLONE
    dw header.SMASHVILLE2,            type.PEACHS_CASTLE
    dw header.BTT_DRM,                type.BTT
    dw header.BTT_GND,                type.BTT
    dw header.BTT_YL,			      type.BTT
    dw header.GREAT_BAY_SSS,		  type.CONGO_JUNGLE
    dw header.BTT_DS,                 type.BTT
    dw header.BTT_STG1,               type.BTT
    dw header.BTT_FALCO,              type.BTT
    dw header.BTT_WARIO,              type.BTT
    dw header.HTEMPLE,                type.CLONE
    dw header.BTT_LUCAS,              type.BTT
    dw header.BTP_GND,                type.BTP
    dw header.NPC,                    type.CLONE
    dw header.BTP_DS,                 type.BTP
    dw header.SMASHKETBALL,		      type.CONGO_JUNGLE
	dw header.BTP_DRM,                type.BTP
	dw header.NORFAIR,                type.PLANET_ZEBES
	dw header.CORNERIACITY,           type.SECTOR_Z
	dw header.FALLS,		      	  type.CONGO_JUNGLE
	dw header.OSOHE,                  type.CLONE
	dw header.YOSHI_STORY_2,          type.PEACHS_CASTLE
	dw header.WORLD1,          		  type.PEACHS_CASTLE
	dw header.FLAT_ZONE_2,            type.PEACHS_CASTLE
	dw header.GERUDO,                 type.CLONE
	dw header.BTP_YL,                 type.BTP

    class_table:
    constant class_table_origin(origin())
    db class.BATTLE                     // Peach's Castle
    db class.BATTLE                     // Sector Z
    db class.BATTLE                     // Congo Jungle
    db class.BATTLE                     // Planet Zebes
    db class.BATTLE                     // Hyrule Castle
    db class.BATTLE                     // Yoshi's Island
    db class.BATTLE                     // Dream Land
    db class.BATTLE                     // Saffron City
    db class.BATTLE                     // Mushroom Kingdom
    db class.BATTLE                     // Dream Land Beta 1
    db class.BATTLE                     // Dream Land Beta 2
    db class.BATTLE                     // How to Play
    db class.BATTLE                     // Yoshi's Island (1P)
    db class.BATTLE                     // Meta Crystal
    db class.BATTLE                     // Batlefield
    db class.RTTF                       // Race to the Finish (Placeholder)
    db class.BATTLE                     // Final Destination
    db class.BTT                        // BTT Mario
    db class.BTT                        // BTT Fox
    db class.BTT                        // BTT DK
    db class.BTT                        // BTT Samus
    db class.BTT                        // BTT Luigi
    db class.BTT                        // BTT Link
    db class.BTT                        // BTT Yoshi
    db class.BTT                        // BTT Falcon
    db class.BTT                        // BTT Kirby
    db class.BTT                        // BTT Pikachu
    db class.BTT                        // BTT Jigglypuff
    db class.BTT                        // BTT Ness
    db class.BTP                        // BTP Mario
    db class.BTP                        // BTP Fox
    db class.BTP                        // BTP DK
    db class.BTP                        // BTP Samus
    db class.BTP                        // BTP Luigi
    db class.BTP                        // BTP Link
    db class.BTP                        // BTP Yoshi
    db class.BTP                        // BTP Falcon
    db class.BTP                        // BTP Kirby
    db class.BTP                        // BTP Pikachu
    db class.BTP                        // BTP Jigglypuff
    db class.BTP                        // BTP Ness
    fill id.MAX_STAGE_ID - id.BTX_LAST
    OS.align(4)

    bonus_pointer_table:
    constant bonus_pointer_table_origin(origin())
    dw 0                                // Peach's Castle
    dw 0                                // Sector Z
    dw 0                                // Congo Jungle
    dw 0                                // Planet Zebes
    dw 0                                // Hyrule Castle
    dw 0                                // Yoshi's Island
    dw 0                                // Dream Land
    dw 0                                // Saffron City
    dw 0                                // Mushroom Kingdom
    dw 0                                // Dream Land Beta 1
    dw 0                                // Dream Land Beta 2
    dw 0                                // How to Play
    dw 0                                // Yoshi's Island (1P)
    dw 0                                // Meta Crystal
    dw 0                                // Batlefield
    dw 0                                // Race to the Finish (Placeholder)
    dw 0                                // Final Destination
    dw 0x8018EEC4                       // BTT Mario
    dw 0x8018EED0                       // BTT Fox
    dw 0x8018EEDC                       // BTT DK
    dw 0x8018EEE8                       // BTT Samus
    dw 0x8018EEF4                       // BTT Luigi
    dw 0x8018EF00                       // BTT Link
    dw 0x8018EF0C                       // BTT Yoshi
    dw 0x8018EF18                       // BTT Falcon
    dw 0x8018EF24                       // BTT Kirby
    dw 0x8018EF30                       // BTT Pikachu
    dw 0x8018EF3C                       // BTT Jigglypuff
    dw 0x8018EF48                       // BTT Ness
    dw 0x8018EF54                       // BTP Mario
    dw 0x8018EF5C                       // BTP Fox
    dw 0x8018EF64                       // BTP DK
    dw 0x8018EF6C                       // BTP Samus
    dw 0x8018EF74                       // BTP Luigi
    dw 0x8018EF7C                       // BTP Link
    dw 0x8018EF84                       // BTP Yoshi
    dw 0x8018EF8C                       // BTP Falcon
    dw 0x8018EF94                       // BTP Kirby
    dw 0x8018EF9C                       // BTP Pikachu
    dw 0x8018EFA4                       // BTP Jigglypuff
    dw 0x8018EFAC                       // BTP Ness
    fill 4 * (id.MAX_STAGE_ID - id.BTX_LAST)

    string_peachs_castle:;          String.insert("Peach's Castle")
    string_sector_z:;               String.insert("Sector Z")
    string_congo_jungle:;           String.insert("Congo Jungle")
    string_planet_zebes:;           String.insert("Planet Zebes")
    string_hyrule_castle:;          String.insert("Hyrule Castle")
    string_yoshis_island:;          String.insert("Yoshi's Island")
    string_dream_land:;             String.insert("Dream Land")
    string_saffron_city:;           String.insert("Saffron City")
    string_mushroom_kingdom:;       String.insert("Mushroom Kingdom")
    string_dream_land_beta_1:;      String.insert("Dream Land Beta 1")
    string_dream_land_beta_2:;      String.insert("Dream Land Beta 2")
    string_how_to_play:;            String.insert("How to Play")
    string_mini_yoshis_island:;     String.insert("Mini Yoshi's Island")
    string_meta_crystal:;           String.insert("Meta Crystal")
    string_duel_zone:;              String.insert("Duel Zone")
    string_final_destination:;      String.insert("Final Destination")
    string_btp:;                    String.insert("Board the Platforms")
    string_btt:;                    String.insert("Break the Targets")

    string_table:
    constant string_table_origin(origin())
    dw string_peachs_castle
    dw string_sector_z
    dw string_congo_jungle
    dw string_planet_zebes
    dw string_hyrule_castle
    dw string_yoshis_island
    dw string_dream_land
    dw string_saffron_city
    dw string_mushroom_kingdom
    dw string_dream_land_beta_1
    dw string_dream_land_beta_2
    dw string_how_to_play
    dw string_mini_yoshis_island
    dw string_meta_crystal
    dw string_duel_zone
    dw string_dream_land                    // Race to the Finish (Placeholder)
    dw string_final_destination
    dw string_btt
    dw string_btt
    dw string_btt
    dw string_btt
    dw string_btt
    dw string_btt
    dw string_btt
    dw string_btt
    dw string_btt
    dw string_btt
    dw string_btt
    dw string_btt
    dw string_btp
    dw string_btp
    dw string_btp
    dw string_btp
    dw string_btp
    dw string_btp
    dw string_btp
    dw string_btp
    dw string_btp
    dw string_btp
    dw string_btp
    dw string_btp
    fill 4 * (id.MAX_STAGE_ID - id.BTX_LAST)

    // @ Description
    // Holds alternate BGM_IDs for each stage:
    // The index of each word corresponds to stage_id.
    // The word is split into 2 halfwords:
    // 0x0000 - Occasional BGM_ID
    // 0x0002 - Rare BGM_ID
    alternate_music_table:
    constant alternate_music_table_origin(origin())
    fill 4 * (id.MAX_STAGE_ID + 1), 0xFF

    variable new_stages(0)

    // @ Description
    // Adds a custom stage
    // TODO: beef this up so adding a stage isn't so painful
    // @ Arguments:
    // name - Short name for quick reference
    // display_name - Name to display
    // bgm_occasional - BGM_ID for the Occasional alternate BGM, or -1 if no alternate. Example: {MIDI.id.COOLCOOLMOUNTAIN}
    // bgm_rare - BGM_ID for the Rare alternate BGM, or -1 if no alternate. Example: {MIDI.id.COOLCOOLMOUNTAIN}
    // tournament_legal - sets the default random stage toggle value for this stage... 1 if legal, 0 if not legal
    // can_toggle - (bool) indicates if this should be toggleable
    // class - stage class (see class scope)
    // btx_word_1 - first BTT related word in table 0x113604 or first BTP related word in table 0x113694
    // btx_word_2 - second BTT related word in table 0x113604 or second BTP related word in table 0x113694
    // btx_word_3 - third BTT related word in table 0x113604
    macro add_stage(name, display_name, bgm_occasional, bgm_rare, tournament_legal, can_toggle, class, btx_word_1, btx_word_2, btx_word_3) {
        global variable new_stages(new_stages + 1)
        evaluate new_stage_id(0x28 + new_stages)
        global define STAGE_{new_stage_id}_TITLE({display_name})
        global define STAGE_{new_stage_id}_LEGAL({tournament_legal})
        global define STAGE_{new_stage_id}_TOGGLE({can_toggle})
        print " - Added Stage 0x"; OS.print_hex({new_stage_id}); print ": ", {display_name}, "\n";

        string_{name}:; String.insert({display_name})

        if {class} == class.BTT {
            btx_words_{name}:
            dw    {btx_word_1}
            dw    {btx_word_2}
            dw    {btx_word_3}
        } else if {class} == class.BTP {
            btx_words_{name}:
            dw    {btx_word_1}
            dw    {btx_word_2}
        }

        pushvar origin, base

        // update class table
        origin class_table_origin + {new_stage_id}
        db     {class}

        // update bonus pointer table
        origin bonus_pointer_table_origin + ({new_stage_id} * 4)
        if {class} == class.BTT {
            dw     btx_words_{name}
        } else if {class} == class.BTP {
            dw     btx_words_{name}
        } else {
            dw     0
        }

        // update string table
        origin string_table_origin + ({new_stage_id} * 4)
        dw     string_{name}

        // update alternate music table
        origin alternate_music_table_origin + ({new_stage_id} * 4)
        dh     {bgm_occasional}
        dh     {bgm_rare}

        pullvar base, origin
    }

    // Add stages here
    add_stage(deku_tree, "Deku Tree", -1, -1, OS.TRUE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(first_destination, "First Destination", -1, -1, OS.TRUE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(ganons_tower, "Ganon's Tower", {MIDI.id.GERUDO_VALLEY}, {MIDI.id.GERUDO_VALLEY}, OS.FALSE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(kalos_pokemon_league, "Kalos Pokemon League", {MIDI.id.ELITE_FOUR}, {MIDI.id.POKEMON_CHAMPION}, OS.TRUE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(pokemon_stadium_2, "Pokemon Stadium", {MIDI.id.POKEMON_CHAMPION}, {MIDI.id.PIKA_CUP}, OS.TRUE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(skyloft, "Skyloft", -1, {MIDI.id.GERUDO_VALLEY}, OS.FALSE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(glacial, "Glacial River", {MIDI.id.CLOCKTOWER}, -1, OS.TRUE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(warioware, "WarioWare, Inc.", {MIDI.id.STARRING_WARIO}, -1, OS.TRUE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(battlefield, "Battlefield", {MIDI.id.DRAGONKING}, -1, OS.TRUE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(flat_zone, "Flat Zone", {MIDI.id.FLAT_ZONE_2}, -1, OS.FALSE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(dr_mario, "Dr. Mario", -1, -1, OS.TRUE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(cool_cool_mountain, "Cool Cool Mountain", -1, -1, OS.FALSE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(dragon_king, "Dragon King", -1, -1, OS.FALSE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(great_bay, "Great Bay", -1, {MIDI.id.GERUDO_VALLEY}, OS.FALSE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(frays_stage, "Fray's Stage", -1, -1, OS.TRUE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(toh, "Tower of Heaven", -1, -1, OS.TRUE, OS.TRUE, class.BATTLE, -1, -1, -1)
	add_stage(fod, "Fountain of Dreams", {MIDI.id.POP_STAR}, -1, OS.FALSE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(muda, "Muda Kingdom", -1, -1, OS.FALSE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(mementos, "Mementos", {MIDI.id.BLOOMING_VILLAIN}, -1, OS.FALSE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(showdown, "Showdown", {MIDI.id.FIRST_DESTINATION}, {MIDI.id.NORFAIR}, OS.FALSE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(spiralm, "Spiral Mountain", -1, -1, OS.TRUE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(n64, "N64", -1, -1, OS.FALSE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(mute, "Mute City", {MIDI.id.FIRE_FIELD}, {MIDI.id.MACHRIDER}, OS.TRUE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(madmm, "Mad Monster Mansion", -1, -1, OS.FALSE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(smbbf, "Mushroom Kingdom BF", -1, -1, OS.TRUE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(smbo, "Mushroom Kingdom O", -1, -1, OS.TRUE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(bowserb, "Bowser's Stadium", {MIDI.id.BOWSERROAD}, {MIDI.id.BOWSERFINAL}, OS.FALSE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(peach2, "Peach's Castle II", {MIDI.id.WING_CAP}, {MIDI.id.METAL_CAP}, OS.FALSE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(delfino, "Delfino Plaza", -1, -1, OS.FALSE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(corneria2, "Corneria", {MIDI.id.STAR_WOLF}, -1, OS.FALSE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(kitchen, "Kitchen Island", {MIDI.id.STARRING_WARIO}, {MIDI.id.HORROR_MANOR}, OS.FALSE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(blue, "Big Blue", {MIDI.id.MACHRIDER}, {MIDI.id.MACHRIDER}, OS.FALSE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(onett, "Onett", {MIDI.id.ALL_I_NEEDED_WAS_YOU}, {MIDI.id.I_BELIEVE_IN_YOU}, OS.FALSE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(zlanding, "Zebes Landing", {MIDI.id.NORFAIR}, -1, OS.TRUE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(frosty, "Frosty Village", -1, -1, OS.FALSE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(smashville2, "Smashville", {MIDI.id.KK_RIDER}, {MIDI.id.SMASHVILLE}, OS.TRUE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(drm_btt, "Break the Targets", -1, -1, OS.FALSE, OS.FALSE, class.BTT, 0x000038F0, 0x00003D10, 0x00003F20)
    add_stage(gnd_btt, "Break the Targets", -1, -1, OS.FALSE, OS.FALSE, class.BTT, 0x00004A50, 0x00005040, 0x00005250)
    add_stage(yl_btt, "Break the Targets", -1, -1, OS.FALSE, OS.FALSE, class.BTT, 0x000035D0, 0x000038A0, 0x00003AB0)
    add_stage(great_bay_sss, "Great Bay", -1, -1, OS.FALSE, OS.FALSE, class.SSS_PREVIEW, -1, -1, -1)
    add_stage(ds_btt, "Break the Targets", -1, -1, OS.FALSE, OS.FALSE, class.BTT, 0x00006188, 0x00006720, 0x00006930)
    add_stage(stg1_btt, "Break the Targets", -1, -1, OS.FALSE, OS.FALSE, class.BTT, 0x00008B10, 0x00008FE0, 0x000091F0)
    add_stage(falco_btt, "Break the Targets", -1, -1, OS.FALSE, OS.FALSE, class.BTT, 0x00004430, 0x00004930, 0x00004B40)
    add_stage(wario_btt, "Break the Targets", -1, -1, OS.FALSE, OS.FALSE, class.BTT, 0x00002F90, 0x00003300, 0x00003510)
    add_stage(htemple, "Hyrule Temple", {MIDI.id.TEMPLE_8BIT}, {MIDI.id.GANONDORF_BATTLE}, OS.FALSE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(lucas_btt, "Break the Targets", -1, -1, OS.FALSE, OS.FALSE, class.BTT, 0x000032D8, 0x00003650, 0x00003860)
    add_stage(gnd_btp, "Board the Platforms", -1, -1, OS.FALSE, OS.FALSE, class.BTP, 0x00003C70, 0x00003DA8, -1)
    add_stage(npc, "New Pork City", {MIDI.id.PIGGYGUYS}, {MIDI.id.UNFOUNDED_REVENGE}, OS.FALSE, OS.TRUE, class.BATTLE, -1, -1, -1)
    add_stage(ds_btp, "Board the Platforms", -1, -1, OS.FALSE, OS.FALSE, class.BTP, 0x00003F10, 0x00003FC0, -1)
    add_stage(smashketball, "Smashketball", {MIDI.id.KENGJR}, -1, OS.FALSE, OS.TRUE, class.BATTLE, -1, -1, -1)
	add_stage(drm_btp, "Board the Platforms", -1, -1, OS.FALSE, OS.FALSE, class.BTP, 0x00004E08, 0x00004EC0, -1)
	add_stage(norfair, "Norfair", -1, -1, OS.FALSE, OS.TRUE, class.BATTLE, -1, -1, -1)
	add_stage(corneriacity, "Corneria City", {MIDI.id.STAR_WOLF}, -1, OS.FALSE, OS.TRUE, class.BATTLE, -1, -1, -1)
	add_stage(falls, "Congo Falls", {MIDI.id.SNAKEY_CHANTEY}, -1, OS.FALSE, OS.TRUE, class.BATTLE, -1, -1, -1)
	add_stage(osohe, "Osohe Castle", {MIDI.id.EVEN_DRIER_GUYS}, -1, OS.FALSE, OS.TRUE, class.BATTLE, -1, -1, -1)
	add_stage(yoshi_story_2, "Yoshi's Story", -1, {MIDI.id.YOSHI_GOLF}, OS.FALSE, OS.TRUE, class.BATTLE, -1, -1, -1)
	add_stage(world1, "World 1-1", -1, -1, OS.FALSE, OS.FALSE, class.BATTLE, -1, -1, -1)
	add_stage(flat_zone_2, "Flat Zone II", {MIDI.id.FLAT_ZONE}, -1, OS.FALSE, OS.TRUE, class.BATTLE, -1, -1, -1)
	add_stage(gerudo, "Gerudo Valley", -1, -1, OS.TRUE, OS.TRUE, class.BATTLE, -1, -1, -1)
	add_stage(yl_btp, "Board the Platforms", -1, -1, OS.FALSE, OS.FALSE, class.BTP, 0x00004D80, 0x00004EB8, -1)

    // @ Description
    // This function replaces the logic to convert the default cursor_id to a stage_id.
    // @ Returns
    // v0 - stage_id
    scope swap_stage_: {
        OS.patch_start(0x0014F774, 0x80133C04)
//      jal     0x80132430                  // original line 1
//      nop                                 // original line 2
        jal     swap_stage_
        nop
        OS.patch_end()

        addiu   sp, sp,-0x0014              // allocate stack space
        sw      t0, 0x0004(sp)              // ~
        sw      ra, 0x0008(sp)              // ~
        sw      at, 0x000C(sp)              // save registers

        jal     get_stage_id_               // v0 = stage_id
        nop

        // this block checks if random is selected (if not stage_id is returned)
        _check_random:
        lli     t0, id.RANDOM               // t0 = id.RANDOM
        bne     v0, t0, _end                // if (stage_id != id.RANDOM), end
        nop

        li      t0, random_count            // ~
        sw      r0, 0x0000(t0)              // reset count

        add_to_list(Toggles.entry_random_stage_peachs_castle, id.PEACHS_CASTLE)
        add_to_list(Toggles.entry_random_stage_sector_z, id.SECTOR_Z)
        add_to_list(Toggles.entry_random_stage_congo_jungle, id.CONGO_JUNGLE)
        add_to_list(Toggles.entry_random_stage_planet_zebes, id.PLANET_ZEBES)
        add_to_list(Toggles.entry_random_stage_hyrule_castle, id.HYRULE_CASTLE)
        add_to_list(Toggles.entry_random_stage_yoshis_island, id.YOSHIS_ISLAND)
        add_to_list(Toggles.entry_random_stage_dream_land, id.DREAM_LAND)
        add_to_list(Toggles.entry_random_stage_saffron_city, id.SAFFRON_CITY)
        add_to_list(Toggles.entry_random_stage_mushroom_kingdom, id.MUSHROOM_KINGDOM)
        add_to_list(Toggles.entry_random_stage_duel_zone, id.DUEL_ZONE)
        add_to_list(Toggles.entry_random_stage_final_destination, id.FINAL_DESTINATION)
        add_to_list(Toggles.entry_random_stage_dream_land_beta_1, id.DREAM_LAND_BETA_1)
        add_to_list(Toggles.entry_random_stage_dream_land_beta_2, id.DREAM_LAND_BETA_2)
        add_to_list(Toggles.entry_random_stage_how_to_play, id.HOW_TO_PLAY)
        add_to_list(Toggles.entry_random_stage_mini_yoshis_island, id.MINI_YOSHIS_ISLAND)
        add_to_list(Toggles.entry_random_stage_meta_crystal, id.META_CRYSTAL)

        // Add custom Stages
        define n(0x29)
        evaluate n({n})
        while {n} <= id.MAX_STAGE_ID {
            evaluate can_toggle({STAGE_{n}_TOGGLE})
            if ({can_toggle} == OS.TRUE) {
                add_to_list(Toggles.entry_random_stage_{n}, {n})
            }
            evaluate n({n}+1)
        }

        beqz    v1, _any_valid_stage        // if there were no valid entries in the random table, then use all stage_ids
        nop

        // this block loads from the random list using a random int
        move    a0, v1                      // a0 - range (0, N-1)
        jal     Global.get_random_int_alt_  // v0 = (0, N-1)
        nop
        li      t0, random_table            // t0 = random_table
        addu    t0, t0, v0                  // t0 = random_table + offset
        lbu     v0, 0x0000(t0)              // v0 = stage_id
        b       _end                        // get a new stage id based off of random offset
        nop

        _any_valid_stage:
        lli     a0, 16 + id.MAX_STAGE_ID - id.BTX_LAST // a0 = number of new stages + original valid 16 stages
        jal     Global.get_random_int_alt_             // v0 = (0, N-1)
        nop
        slti    t0, v0, id.RACE_TO_THE_FINISH          // if it's a stage_id low enough, then we don't have to correct it
        bnez    t0, _end                               // so skip to end
        nop                                            // otherwise, we'll have to shift it:
        addiu   v0, v0, 0x0001                         // v0 = adjusted stage_id
        lli     t0, id.FINAL_DESTINATION               // if it's RACE_TO_THE_FINISH,
        beq     t0, v0, _end                           // then return FINAL_DESTINATION
        nop
        addiu   v0, v0, id.BTX_LAST - id.BTX_FIRST - 1 // otherwise it's a new stage, so adjust accordingly
        // now make sure it's a valid BATTLE stage
        li      at, class_table                        // at = class_table
        addu    at, at, v0                             // at = address of class
        lbu     at, 0x0000(at)                         // at = class (0 if BATTLE)
        bnez    at, _any_valid_stage                   // if it's not a BATTLE stage, try again
        nop

        _end:
        lw      t0, 0x0004(sp)              // ~
        lw      ra, 0x0008(sp)              // ~
        lw      at, 0x000C(sp)              // restore registers
        addiu   sp, sp, 0x0014              // deallocate stack space
        jr      ra                          // return
        nop
    }

}

} // __STAGES__
