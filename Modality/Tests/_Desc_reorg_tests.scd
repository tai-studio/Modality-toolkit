MKtlDesc.loadDescs.size;
MKtlDesc.allDescs.size;
MKtlDesc.openFolder;
MKtlDesc.at('keith-mcmillen-qunexus_port1_AB').openFile;

~vm = MKtlDesc("*vmeter");
~vm.elementsDesc.elements[0];
~vm.elAt;
~vm.dictAt(\slider);

~pf = MKtlDesc("*tfader");
~pf.elementsDesc.elements[0].midiMsgType;
~pf.elAt(\3);
~pf.elAt(0);
~pf.elementsDesc.elements.collect (_[\key])

~dj = MKtlDesc("decampo-joybox");
~dj.elAt(0, \x);
~dj.elAt(\1, \y);
~dj.elAt(0, \x)[\ioType];

~mb = MKtlDesc("sensestage-minibee1");
~mb.elAt(\x).elementType;
~mb.elAt(\x);
~mb.elementsDesc.keys;
~mb.fullDesc.deviceIOGroups;

~trig = MKtlDesc("*finger");
~trig.fullDesc.elementsDesc.elements[0]
~trig.elAt(0).key;
~trig.elAt(1).key;
~trig.elAt(\pad, 0);

~trig.elAt(\pad, \13);
~trig.elAt(\pad, 12);

~trig.elAt(\kn, 7).spec;

~lpd = MKtlDesc("*lpd8");
~lpd.elAt(\kn, 0);
~lpd.elAt(\pad, 0).midiMsgType;

~nk2 = MKtlDesc("*trol2");
~nk2.elAt(\kn, 0);

~nk2.elAt(\bt, \S, 1);
~nk2.elAt(\knixi, 0); // return nil if lookup fails


~gp = MKtlDesc("*drive");
~gp.elAt(\compass);
~gp.elAt(\bt, 0);
~gp.elAt(\bt, \1);

g = MKtlElementGroup.fromDesc(~gp.elementsDesc);
g.deepAt2(\bt, \2);

MKtl(\gp, "*drive");
MKtl(\gp).postElements;
MKtl(\gp).gui;
MKtl(\gp).trace
MKtl(\gp).elementsDict.keys;
MKtl(\gp).desc.openFile

MKtl(\nk, "*trol2");
MKtl(\nk).gui;
MKtl(\nk).elementGroup.dict.keys; // still wrong, should be the names
MKtl(\nk).elAt(\kn);





// done already - sharing properties down
MKtlDesc.sharePropsToElements(~pf.elementsDesc);

MKtlDesc.postLoadable;
MKtlDesc.postLoaded;
MKtlDesc.postStatus;

MKtlDesc.elementTypesUsed;
MKtlDesc.deviceTypesUsed;

localNameKey:
hierarKey:
hierKey:

(key: )

srcAddr
destAddr
// elementKey: \joy_l_x


-dictAt (key)
-elAt ( ... args)
-elKeys
-elementTypesUsed
-elementsDict