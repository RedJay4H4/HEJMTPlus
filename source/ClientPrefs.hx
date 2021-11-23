package;

import flixel.FlxG;
import flixel.util.FlxSave;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;

class ClientPrefs {
	//TO DO: Redo ClientPrefs in a way that isn't too stupid
	public static var downScroll:Bool = false;
	public static var middleScroll:Bool = false;
	public static var advancedScoreTxt:Bool = false;
	public static var showFPS:Bool = false;
	public static var flashing:Bool = true;
	public static var globalAntialiasing:Bool = true;
	public static var noteSplashes:Bool = true;
	public static var lowQuality:Bool = false;
	public static var framerate:Int = 120;
	public static var cursing:Bool = true;
	public static var violence:Bool = true;
	public static var camZooms:Bool = true;
	public static var hideHud:Bool = false;
	public static var noteOffset:Int = 0;
	public static var arrowHSV:Array<Array<Int>> = [[0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0]];
	public static var imagesPersist:Bool = false;
	public static var ghostTapping:Bool = true;
	public static var hideTime:Bool = true;
	public static var dadNotesDoDamage:Bool = false;
	public static var infoBarBounces:Bool = false;
	public static var dadNotesCanKill:Bool = false;
	public static var damageFromDadNotes:Int = 10;
	public static var noHealthGain:Int = 0;
	public static var dadNotesVisible:Bool = true;
	public static var bfNotesVisible:Bool = true;
	public static var stunsBlockInputs:Bool = false;
	public static var shakeOnMiss:Bool = false;
	public static var playMissAnimations:Bool = true;
	public static var playHitSounds:Bool = false;
	public static var maxOptimization:Bool = false;
	public static var missesLowerMaxHealth:Bool = false;
	public static var hardMode:Bool = false;

	public static var defaultKeys:Array<FlxKey> = [
		A, LEFT,			//Note Left
		S, DOWN,			//Note Down
		W, UP,				//Note Up
		D, RIGHT,			//Note Right

		A, LEFT,			//UI Left
		S, DOWN,			//UI Down
		W, UP,				//UI Up
		D, RIGHT,			//UI Right

		R, NONE,			//Reset
		SPACE, ENTER,		//Accept
		BACKSPACE, ESCAPE,	//Back
		ENTER, ESCAPE		//Pause
	];
	//Every key has two binds, these binds are defined on defaultKeys! If you want your control to be changeable, you have to add it on ControlsSubState (inside OptionsState)'s list
	public static var keyBinds:Array<Dynamic> = [
		//Key Bind, Name for ControlsSubState
		[Control.NOTE_LEFT, 'Left'],
		[Control.NOTE_DOWN, 'Down'],
		[Control.NOTE_UP, 'Up'],
		[Control.NOTE_RIGHT, 'Right'],

		[Control.UI_LEFT, 'Left '],		//Added a space for not conflicting on ControlsSubState
		[Control.UI_DOWN, 'Down '],		//Added a space for not conflicting on ControlsSubState
		[Control.UI_UP, 'Up '],			//Added a space for not conflicting on ControlsSubState
		[Control.UI_RIGHT, 'Right '],	//Added a space for not conflicting on ControlsSubState

		[Control.RESET, 'Reset'],
		[Control.ACCEPT, 'Accept'],
		[Control.BACK, 'Back'],
		[Control.PAUSE, 'Pause']
	];
	public static var lastControls:Array<FlxKey> = defaultKeys.copy();

	public static function saveSettings() {
		FlxG.save.data.downScroll = downScroll;
		FlxG.save.data.middleScroll = middleScroll;
		FlxG.save.data.advancedScoreTxt = advancedScoreTxt;
		FlxG.save.data.showFPS = showFPS;
		FlxG.save.data.flashing = flashing;
		FlxG.save.data.globalAntialiasing = globalAntialiasing;
		FlxG.save.data.noteSplashes = noteSplashes;
		FlxG.save.data.lowQuality = lowQuality;
		FlxG.save.data.framerate = framerate;
		FlxG.save.data.cursing = cursing;
		FlxG.save.data.violence = violence;
		FlxG.save.data.camZooms = camZooms;
		FlxG.save.data.noteOffset = noteOffset;
		FlxG.save.data.hideHud = hideHud;
		FlxG.save.data.arrowHSV = arrowHSV;
		FlxG.save.data.imagesPersist = imagesPersist;
		FlxG.save.data.ghostTapping = ghostTapping;
		FlxG.save.data.hideTime = hideTime;
		FlxG.save.data.dadNotesDoDamage = dadNotesDoDamage;
		FlxG.save.data.infoBarBounces = infoBarBounces;
		FlxG.save.data.dadNotesCanKill = dadNotesCanKill;
		FlxG.save.data.damageFromDadNotes = damageFromDadNotes;
		FlxG.save.data.noHealthGain = noHealthGain;
		FlxG.save.data.dadNotesVisible = dadNotesVisible;
		FlxG.save.data.bfNotesVisible = bfNotesVisible;
		FlxG.save.data.stunsBlockInputs = stunsBlockInputs;
		FlxG.save.data.shakeOnMiss = shakeOnMiss;
		FlxG.save.data.playMissAnimations = playMissAnimations;
		FlxG.save.data.playHitSounds = playHitSounds;
		FlxG.save.data.maxOptimization = maxOptimization;
		FlxG.save.data.missesLowerMaxHealth = missesLowerMaxHealth;
		FlxG.save.data.hardMode = hardMode;

		var achieves:Array<String> = [];
		for (i in 0...Achievements.achievementsUnlocked.length) {
			if(Achievements.achievementsUnlocked[i][1]) {
				achieves.push(Achievements.achievementsUnlocked[i][0]);
			}
		}
		FlxG.save.data.achievementsUnlocked = achieves;
		FlxG.save.data.henchmenDeath = Achievements.henchmenDeath;
		FlxG.save.flush();

		var save:FlxSave = new FlxSave();
		save.bind('controls', 'ninjamuffin99'); //Placing this in a separate save so that it can be manually deleted without removing your Score and stuff
		save.data.customControls = lastControls;
		save.flush();
		FlxG.log.add("Settings saved!");
	}

	public static function loadPrefs() {
		if(FlxG.save.data.downScroll != null) {
			downScroll = FlxG.save.data.downScroll;
		}
		if(FlxG.save.data.middleScroll != null) {
			middleScroll = FlxG.save.data.middleScroll;
		}
		if(FlxG.save.data.advancedScoreTxt != null) {
			advancedScoreTxt = FlxG.save.data.advancedScoreTxt;
		}
		if(FlxG.save.data.showFPS != null) {
			showFPS = FlxG.save.data.showFPS;
			if(Main.fpsVar != null) {
				Main.fpsVar.visible = showFPS;
			}
		}
		if(FlxG.save.data.flashing != null) {
			flashing = FlxG.save.data.flashing;
		}
		if(FlxG.save.data.globalAntialiasing != null) {
			globalAntialiasing = FlxG.save.data.globalAntialiasing;
		}
		if(FlxG.save.data.noteSplashes != null) {
			noteSplashes = FlxG.save.data.noteSplashes;
		}
		if(FlxG.save.data.lowQuality != null) {
			lowQuality = FlxG.save.data.lowQuality;
		}
		if(FlxG.save.data.framerate != null) {
			framerate = FlxG.save.data.framerate;
			if(framerate > FlxG.drawFramerate) {
				FlxG.updateFramerate = framerate;
				FlxG.drawFramerate = framerate;
			} else {
				FlxG.drawFramerate = framerate;
				FlxG.updateFramerate = framerate;
			}
		}
		/*if(FlxG.save.data.cursing != null) {
			cursing = FlxG.save.data.cursing;
		}
		if(FlxG.save.data.violence != null) {
			violence = FlxG.save.data.violence;
		}*/
		if(FlxG.save.data.camZooms != null) {
			camZooms = FlxG.save.data.camZooms;
		}
		if(FlxG.save.data.hideHud != null) {
			hideHud = FlxG.save.data.hideHud;
		}
		if(FlxG.save.data.noteOffset != null) {
			noteOffset = FlxG.save.data.noteOffset;
		}
		if(FlxG.save.data.arrowHSV != null) {
			arrowHSV = FlxG.save.data.arrowHSV;
		}
		if(FlxG.save.data.imagesPersist != null) {
			imagesPersist = FlxG.save.data.imagesPersist;
			FlxGraphic.defaultPersist = ClientPrefs.imagesPersist;
		}
		if(FlxG.save.data.ghostTapping != null) {
			ghostTapping = FlxG.save.data.ghostTapping;
		}
		if(FlxG.save.data.hideTime != null) {
			hideTime = FlxG.save.data.hideTime;
		}
		if(FlxG.save.data.dadNotesDoDamage != null) {
			dadNotesDoDamage = FlxG.save.data.dadNotesDoDamage;
		}
		if(FlxG.save.data.infoBarBounces != null) {
			infoBarBounces = FlxG.save.data.infoBarBounces;
		}
		if(FlxG.save.data.dadNotesCanKill != null) {
			dadNotesCanKill = FlxG.save.data.dadNotesCanKill;
		}
		if(FlxG.save.data.damageFromDadNotes != null) {
			damageFromDadNotes = FlxG.save.data.damageFromDadNotes;
		}
		if(FlxG.save.data.noHealthGain != null) {
			noHealthGain = FlxG.save.data.noHealthGain;
		}
		if(FlxG.save.data.dadNotesVisible != null) {
			dadNotesVisible = FlxG.save.data.dadNotesVisible;
		}
		if(FlxG.save.data.bfNotesVisible != null) {
			bfNotesVisible = FlxG.save.data.bfNotesVisible;
		}
		if(FlxG.save.data.stunsBlockInputs != null) {
			stunsBlockInputs = FlxG.save.data.stunsBlockInputs;
		}
		if(FlxG.save.data.shakeOnMiss != null) {
			shakeOnMiss = FlxG.save.data.shakeOnMiss;
		}
		if(FlxG.save.data.playMissAnimations != null) {
			playMissAnimations = FlxG.save.data.playMissAnimations;
		}
		if(FlxG.save.data.playHitSounds != null) {
			playHitSounds = FlxG.save.data.playHitSounds;
		}
		if(FlxG.save.data.maxOptimization != null) {
			maxOptimization = FlxG.save.data.maxOptimization;
		}
		if(FlxG.save.data.missesLowerMaxHealth != null) {
			missesLowerMaxHealth = FlxG.save.data.missesLowerMaxHealth;
		}
		if(FlxG.save.data.hardMode != null) {
			hardMode = FlxG.save.data.hardMode;
		}

		var save:FlxSave = new FlxSave();
		save.bind('controls', 'ninjamuffin99');
		if(save != null && save.data.customControls != null) {
			reloadControls(save.data.customControls);
		}
	}

	public static function reloadControls(newKeys:Array<FlxKey>) {
		ClientPrefs.removeControls(ClientPrefs.lastControls);
		ClientPrefs.lastControls = newKeys.copy();
		ClientPrefs.loadControls(ClientPrefs.lastControls);
	}

	private static function removeControls(controlArray:Array<FlxKey>) {
		for (i in 0...keyBinds.length) {
			var controlValue:Int = i*2;
			var controlsToRemove:Array<FlxKey> = [];
			for (j in 0...2) {
				if(controlArray[controlValue+j] != NONE) {
					controlsToRemove.push(controlArray[controlValue+j]);
				}
			}
			if(controlsToRemove.length > 0) {
				PlayerSettings.player1.controls.unbindKeys(keyBinds[i][0], controlsToRemove);
			}
		}
	}
	private static function loadControls(controlArray:Array<FlxKey>) {
		for (i in 0...keyBinds.length) {
			var controlValue:Int = i*2;
			var controlsToAdd:Array<FlxKey> = [];
			for (j in 0...2) {
				if(controlArray[controlValue+j] != NONE) {
					controlsToAdd.push(controlArray[controlValue+j]);
				}
			}
			if(controlsToAdd.length > 0) {
				PlayerSettings.player1.controls.bindKeys(keyBinds[i][0], controlsToAdd);
			}
		}
	}
}
