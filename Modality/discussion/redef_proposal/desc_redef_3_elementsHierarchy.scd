/*********

4 steps towards redefining .desc.scd files:

1. An example for a simple desc file (LPD8) with comments

2. general info section in full detail

3. the entire elementsDesc in full detail

4. the single elementDesc in full detail

*********/

// 3. the elementsDesc in full detail

// general section her for completeness only...
(
deviceName: "LPD8",
protocol: \midi,
deviceType: \drumpad,
elementTypes: [\pad, \knob],
status: "unknown",

idInfo: "LPD8",

deviceInfo: (
	vendorURI: "http://www.akaipro.com/product/lpd8",
	manualURI: "http://www.akaipro.com/product/lpd8#downloads",
	description: "a basic drumpad controller", // one line text
	features: [
		// ...
	],
	notes: "use only recommended hardware mode XYZ.",
),

// and here the details begin:
// changed from description: to elementsDesc: for clarity,
// the elements themselves are under elements:,
// so other info for the group can go here for flexibility

elementsDesc: (

	// maybe a reserved name for comment-like things
	'_info': (
		text: "anything useful for this group of elements",
		anyKey: [\what, \so, \ever],
	),

	// optional alternative groupings of these elements,
	// which should best live in the elementGroup itself
	// any elements contained in this group can be used,
	// and usually one only creates alt-groups at the top level
	groups: (
		padUpper: [\pad, \on, [4,5,6,7]],
		padLower: [\pad, \on, [0,1,2,3]]
	),

	// formerly known as collectives for OSC mainly,
	// new name and exact creation implementation to be rethought
	// should know to create shared responders/messageSends.
	// ( collectives in too nice a name to reserve for a technical
	// necessity only :-)

	sharedValueGroups: (

	),

	// any shared element or group properties can be set once,
	// e.g. same midiChan: 0, midiMsgType: \cc etc
	shared: (),

	// and these are the actual elements, again in groups:
	elements: (
		\kn: (
			//	groupName: \kn, // auto-generated from key above
			groupType: \knobGroup,

			// properties that all elements in this group share:
			shared: (\elementType: \knob, \midiMsgType: \cc,
				\spec: \midiCC, \ioType: \inout, midiChan: 0),

			// and the elements themselves, here as a named dict,
			// listed one by one - only the differing items need be here
			// (can also not use shared: and just put everything here.)
			elements: (
				'1': (\midiNum: 1),
				'2': (\midiNum: 2),
				'3': (\midiNum: 3),
				'4': (\midiNum: 4),
				'5': (\midiNum: 5),
				'6': (\midiNum: 6),
				'7': (\midiNum: 7),
				'8': (\midiNum: 8)
			)
		),

		\pad: (
			//	groupName: \pad, // auto-generated from key above,

			groupType: \padGroup,

			shared: (\elementType: \pad, \spec: \midiVel, \ioType: \inout),

			elements: (

				// a sublist of noteOn/offs - shared params:
				shared: (\midiMsgType: \noteOn, \midiChan: 0),

				// element groups for noteOn, noteOff,
				// here generated algorithmically:
				elements: (
					\on: Event.newFrom( (36..43).collect { |note, i|
						[ (i+1).asSymbol, (\midiNum: note) ]
					}.flatten ),
					\off: Event.newFrom( (36..43).collect { |note, i|
						[ (i+1).asSymbol, (\midiNum: note) ]
					}.flatten )
				)
			)
		)
	)
);