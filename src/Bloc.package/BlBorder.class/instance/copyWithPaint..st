copy
copyWithPaint: aPaint

	self
		assert: [ aPaint isNotNil ]
		description: [ 'Paint must not be nil' ].

	^ self class basicNew
		initialize;
		paint: aPaint asBlPaint
		style: style
		width: width;
		yourself