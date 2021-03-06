(* ::Package:: *)

(* ::Title:: *)
(*Predicting Chemical Properties From Structure*)


(* ::Section:: *)
(*Prediction*)


(* ::Subsection::Closed:: *)
(*Melting Point*)


(* ::Input:: *)
(*fileLoc=NotebookDirectory[];*)
(*nFeat=250;*)
(*tempfile=StringJoin[fileLoc,"FinalSet.wl"];*)
(*Get[tempfile];*)
(*totalSet=RandomSample[totalSet,Length[totalSet]];*)
(**)
(*Lset=Length[totalSet];*)
(**)
(*trainSet=totalSet[[1;;Round[0.7*Lset]]];*)
(*testSet=totalSet[[Round[0.7*Lset]+1;;Round[0.85*Lset]]];*)
(*validSet=totalSet[[Round[0.85*Lset]+1;;]];*)


(* ::Input:: *)
(*hashesTrain=Table[trainSet[[i]]["Hashes"],{i,1,Length[trainSet]}];*)
(*hashesTest=Table[testSet[[i]]["Hashes"],{i,1,Length[testSet]}];*)
(*hashesValid=Table[validSet[[i]]["Hashes"],{i,1,Length[validSet]}];*)
(**)
(*flatHashes=Flatten[DeleteDuplicates/@hashesTrain];*)
(*commonHashes=SortBy[Tally[flatHashes],-#[[2]]&];*)
(**)
(*(*featureList=#[[2]]&/@Select[commonHashes,#[[2]]>100&];*)*)
(*featureList=Commonest[flatHashes,nFeat];*)
(**)
(*groupsTrain=Table[Count[hashesTrain[[i]],featureList[[j]]],{i,1,Length[hashesTrain]},{j,1,Length[featureList]}];*)
(*groupsTest=Table[Count[hashesTest[[i]],featureList[[j]]],{i,1,Length[hashesTest]},{j,1,Length[featureList]}];*)
(*groupsValid=Table[Count[hashesValid[[i]],featureList[[j]]],{i,1,Length[hashesValid]},{j,1,Length[featureList]}];*)
(**)
(*atomTalliesTrain=Table[trainSet[[i]]["AtomTally"],{i,1,Length[trainSet]}];*)
(*atomTalliesTest=Table[testSet[[i]]["AtomTally"],{i,1,Length[testSet]}];*)
(*atomTalliesValid=Table[validSet[[i]]["AtomTally"],{i,1,Length[validSet]}];*)
(**)
(*allInputsTrain=Table[*)
(*				Flatten[*)
(*					{groupsTrain[[i]],*)
(*					trainSet[[i]]["Cis"],*)
(*					trainSet[[i]]["Trans"],*)
(*					trainSet[[i]]["BondTally"],*)
(*					trainSet[[i]]["TopoFeatures"],*)
(*					trainSet[[i]]["Geom"],*)
(*					Total[Abs[trainSet[[i]]["FormalCharges"]]],*)
(*					QuantityMagnitude[trainSet[[i]]["TopologicalPolarSurfaceArea"]],*)
(*					trainSet[[i]]["NetCharge"],*)
(*					trainSet[[i]]["RotatableBondCount"],*)
(*					trainSet[[i]]["HBondAcceptorCount"],*)
(*					trainSet[[i]]["HBondDonorCount"],*)
(*					trainSet[[i]]["PrincipalMom"],*)
(*					QuantityMagnitude[trainSet[[i]]["MolarMass"]],*)
(*					QuantityMagnitude[trainSet[[i]]["MolarMass"]]/Total[atomTalliesTrain[[i]]],*)
(*					atomTalliesTrain[[i]]}*)
(*				],*)
(*				{i,1,Length[trainSet]}];*)
(**)
(*allInputsTest=Table[*)
(*				Flatten[*)
(*					{groupsTest[[i]],*)
(*					testSet[[i]]["Cis"],*)
(*					testSet[[i]]["Trans"],*)
(*					testSet[[i]]["BondTally"],*)
(*					testSet[[i]]["TopoFeatures"],*)
(*					testSet[[i]]["Geom"],*)
(*					Total[Abs[testSet[[i]]["FormalCharges"]]],*)
(*					QuantityMagnitude[testSet[[i]]["TopologicalPolarSurfaceArea"]],*)
(*					testSet[[i]]["NetCharge"],*)
(*					testSet[[i]]["RotatableBondCount"],*)
(*					testSet[[i]]["HBondAcceptorCount"],*)
(*					testSet[[i]]["HBondDonorCount"],*)
(*					testSet[[i]]["PrincipalMom"],*)
(*					QuantityMagnitude[testSet[[i]]["MolarMass"]],*)
(*					QuantityMagnitude[testSet[[i]]["MolarMass"]]/Total[atomTalliesTest[[i]]],*)
(*					atomTalliesTest[[i]]}*)
(*					],*)
(*					{i,1,Length[testSet]}];*)
(*					*)
(*allInputsValid=Table[*)
(*				Flatten[*)
(*					{groupsValid[[i]],*)
(*					validSet[[i]]["Cis"],*)
(*					validSet[[i]]["Trans"],*)
(*					validSet[[i]]["BondTally"],*)
(*					validSet[[i]]["TopoFeatures"],*)
(*					validSet[[i]]["Geom"],*)
(*					Total[Abs[validSet[[i]]["FormalCharges"]]],*)
(*					QuantityMagnitude[validSet[[i]]["TopologicalPolarSurfaceArea"]],*)
(*					validSet[[i]]["NetCharge"],*)
(*					validSet[[i]]["RotatableBondCount"],*)
(*					validSet[[i]]["HBondAcceptorCount"],*)
(*					validSet[[i]]["HBondDonorCount"],*)
(*					validSet[[i]]["PrincipalMom"],*)
(*					QuantityMagnitude[validSet[[i]]["MolarMass"]],*)
(*					QuantityMagnitude[validSet[[i]]["MolarMass"]]/Total[atomTalliesValid[[i]]],*)
(*					atomTalliesValid[[i]]}*)
(*					],*)
(*					{i,1,Length[validSet]}];*)
(**)
(**)
(*outputTrain=Table[*)
(*				QuantityMagnitude[*)
(*					UnitConvert[*)
(*						trainSet[[i]]["MeltingPoint"],*)
(*						"Kelvins"*)
(*						]*)
(*					],*)
(*				{i,1,Length[trainSet]}];*)
(**)
(*outputTest=Table[*)
(*				QuantityMagnitude[*)
(*					UnitConvert[*)
(*						testSet[[i]]["MeltingPoint"],*)
(*						"Kelvins"*)
(*						]*)
(*					],*)
(*				{i,1,Length[testSet]}];*)
(*				*)
(*outputValid=Table[*)
(*				QuantityMagnitude[*)
(*					UnitConvert[*)
(*						validSet[[i]]["MeltingPoint"],*)
(*						"Kelvins"*)
(*						]*)
(*					],*)
(*				{i,1,Length[validSet]}];*)
(*				*)
(*					*)
(*							*)
(**)
(*trainData=Thread[allInputsTrain-> outputTrain];*)
(*testData=Thread[allInputsTest-> outputTest];*)
(*validData=Thread[allInputsValid-> outputValid];*)


(* ::Input:: *)
(*Clear[p];Clear[pm];p=Predict[trainData,ValidationSet->validData,FeatureTypes->"NumericalVector",PerformanceGoal->"Quality",Method->{"RandomForest","TreeNumber"-> 250,"LeafSize"->3}];*)


(* ::Input:: *)
(*pm=PredictorMeasurements[p,testData];*)
(*regressedData=p[allInputsTest];*)
(**)
(**)
(**)
(*meanPercentDiff=Mean[Abs[(regressedData-outputTest)/outputTest]]*100;*)
(*medDiff=Median[Abs[(regressedData-outputTest)]];*)
(**)
(*{pm["StandardDeviation"],pm["MeanDeviation"],medDiff,meanPercentDiff}*)


(* ::Input:: *)
(*range=Max[Join[outputTest,regressedData]]-Min[Join[outputTest,regressedData]];*)
(*aMin=Min[Join[outputTest,regressedData]]-0.05*range;*)
(*aMax=Max[Join[outputTest,regressedData]]+0.05*range;*)
(**)
(*Show[*)
(*ListPlot[*)
(*Table[*)
(*Tooltip[*)
(*{regressedData[[i]],outputTest[[i]]},*)
(*Column[*)
(*{*)
(*Keys[testSet][[i]],*)
(*Row[{"Predicted: " ,regressedData[[i]]," K"}],*)
(*Row[{"Actual: ",outputTest[[i]]," K"}]*)
(*}*)
(*]*)
(*],*)
(*{i,1,Length[testSet]}],*)
(*PlotRange->{{aMin,aMax},{aMin,aMax}},*)
(*AspectRatio->1,*)
(*AxesLabel->{"Predicted Value","Actual Value"},*)
(*LabelStyle->Large,*)
(*GridLines->Automatic*)
(*],*)
(*Graphics[{Dashed,Red,Line[{{aMin,aMin},{aMax,aMax}}]}]*)
(*]*)
(**)
(*pm["ResidualHistogram"]*)


(* ::Subsection::Closed:: *)
(*Boiling Point*)


(* ::Input:: *)
(*fileLoc=NotebookDirectory[];*)
(*nFeat=250;*)
(*tempfile=StringJoin[fileLoc,"FinalSet.wl"];*)
(*Get[tempfile];*)
(*totalSet=RandomSample[totalSet,Length[totalSet]];*)
(*Lset=Length[totalSet];*)
(**)
(*trainSet=totalSet[[1;;Round[0.7*Lset]]];*)
(*testSet=totalSet[[Round[0.7*Lset]+1;;Round[0.85*Lset]]];*)
(*validSet=totalSet[[Round[0.85*Lset]+1;;]];*)


(* ::Input:: *)
(*hashesTrain=Table[trainSet[[i]]["Hashes"],{i,1,Length[trainSet]}];*)
(*hashesTest=Table[testSet[[i]]["Hashes"],{i,1,Length[testSet]}];*)
(*hashesValid=Table[validSet[[i]]["Hashes"],{i,1,Length[validSet]}];*)
(**)
(*flatHashes=Flatten[DeleteDuplicates/@hashesTrain];*)
(*commonHashes=SortBy[Tally[flatHashes],-#[[2]]&];*)
(**)
(*(*featureList=#[[2]]&/@Select[commonHashes,#[[2]]>100&];*)*)
(*featureList=Commonest[flatHashes,nFeat];*)
(**)
(*groupsTrain=Table[Count[hashesTrain[[i]],featureList[[j]]],{i,1,Length[hashesTrain]},{j,1,Length[featureList]}];*)
(*groupsTest=Table[Count[hashesTest[[i]],featureList[[j]]],{i,1,Length[hashesTest]},{j,1,Length[featureList]}];*)
(*groupsValid=Table[Count[hashesValid[[i]],featureList[[j]]],{i,1,Length[hashesValid]},{j,1,Length[featureList]}];*)
(**)
(*atomTalliesTrain=Table[trainSet[[i]]["AtomTally"],{i,1,Length[trainSet]}];*)
(*atomTalliesTest=Table[testSet[[i]]["AtomTally"],{i,1,Length[testSet]}];*)
(*atomTalliesValid=Table[validSet[[i]]["AtomTally"],{i,1,Length[validSet]}];*)
(*allInputsTrain=Table[*)
(*				Flatten[*)
(*					{groupsTrain[[i]],*)
(*					trainSet[[i]]["Cis"],*)
(*					trainSet[[i]]["Trans"],*)
(*					trainSet[[i]]["BondTally"],*)
(*					trainSet[[i]]["TopoFeatures"],*)
(*					trainSet[[i]]["Geom"],*)
(*					Total[Abs[trainSet[[i]]["FormalCharges"]]],*)
(*					QuantityMagnitude[trainSet[[i]]["TopologicalPolarSurfaceArea"]],*)
(*					trainSet[[i]]["NetCharge"],*)
(*					trainSet[[i]]["RotatableBondCount"],*)
(*					trainSet[[i]]["HBondAcceptorCount"],*)
(*					trainSet[[i]]["HBondDonorCount"],*)
(*					trainSet[[i]]["PrincipalMom"],*)
(*					QuantityMagnitude[trainSet[[i]]["MolarMass"]],*)
(*					QuantityMagnitude[trainSet[[i]]["MolarMass"]]/Total[atomTalliesTrain[[i]]],*)
(*					atomTalliesTrain[[i]]}*)
(*				],*)
(*				{i,1,Length[trainSet]}];*)
(**)
(*allInputsTest=Table[*)
(*				Flatten[*)
(*					{groupsTest[[i]],*)
(*					testSet[[i]]["Cis"],*)
(*					testSet[[i]]["Trans"],*)
(*					testSet[[i]]["BondTally"],*)
(*					testSet[[i]]["TopoFeatures"],*)
(*					testSet[[i]]["Geom"],*)
(*					Total[Abs[testSet[[i]]["FormalCharges"]]],*)
(*					QuantityMagnitude[testSet[[i]]["TopologicalPolarSurfaceArea"]],*)
(*					testSet[[i]]["NetCharge"],*)
(*					testSet[[i]]["RotatableBondCount"],*)
(*					testSet[[i]]["HBondAcceptorCount"],*)
(*					testSet[[i]]["HBondDonorCount"],*)
(*					testSet[[i]]["PrincipalMom"],*)
(*					QuantityMagnitude[testSet[[i]]["MolarMass"]],*)
(*					QuantityMagnitude[testSet[[i]]["MolarMass"]]/Total[atomTalliesTest[[i]]],*)
(*					atomTalliesTest[[i]]}*)
(*					],*)
(*					{i,1,Length[testSet]}];*)
(*					*)
(*allInputsValid=Table[*)
(*				Flatten[*)
(*					{groupsValid[[i]],*)
(*					validSet[[i]]["Cis"],*)
(*					validSet[[i]]["Trans"],*)
(*					validSet[[i]]["BondTally"],*)
(*					validSet[[i]]["TopoFeatures"],*)
(*					validSet[[i]]["Geom"],*)
(*					Total[Abs[validSet[[i]]["FormalCharges"]]],*)
(*					QuantityMagnitude[validSet[[i]]["TopologicalPolarSurfaceArea"]],*)
(*					validSet[[i]]["NetCharge"],*)
(*					validSet[[i]]["RotatableBondCount"],*)
(*					validSet[[i]]["HBondAcceptorCount"],*)
(*					validSet[[i]]["HBondDonorCount"],*)
(*					validSet[[i]]["PrincipalMom"],*)
(*					QuantityMagnitude[validSet[[i]]["MolarMass"]],*)
(*					QuantityMagnitude[validSet[[i]]["MolarMass"]]/Total[atomTalliesValid[[i]]],*)
(*					atomTalliesValid[[i]]}*)
(*					],*)
(*					{i,1,Length[validSet]}];*)
(**)
(**)
(*outputTrain=Table[*)
(*				QuantityMagnitude[*)
(*					UnitConvert[*)
(*						trainSet[[i]]["BoilingPoint"],*)
(*						"Kelvins"*)
(*						]*)
(*					],*)
(*				{i,1,Length[trainSet]}];*)
(**)
(*outputTest=Table[*)
(*				QuantityMagnitude[*)
(*					UnitConvert[*)
(*						testSet[[i]]["BoilingPoint"],*)
(*						"Kelvins"*)
(*						]*)
(*					],*)
(*				{i,1,Length[testSet]}];*)
(*				*)
(*outputValid=Table[*)
(*				QuantityMagnitude[*)
(*					UnitConvert[*)
(*						validSet[[i]]["BoilingPoint"],*)
(*						"Kelvins"*)
(*						]*)
(*					],*)
(*				{i,1,Length[validSet]}];*)
(*				*)
(*					*)
(*							*)
(**)
(*trainData=Thread[allInputsTrain-> outputTrain];*)
(*testData=Thread[allInputsTest-> outputTest];*)
(*validData=Thread[allInputsValid-> outputValid];*)


(* ::Input:: *)
(*Clear[p];Clear[pm];p=Predict[trainData,ValidationSet->validData,FeatureTypes->"NumericalVector",PerformanceGoal->"Quality",Method->"RandomForest"];*)


(* ::Input:: *)
(*pm=PredictorMeasurements[p,testData];*)
(*regressedData=p[allInputsTest];*)
(**)
(**)
(**)
(*meanPercentDiff=Mean[Abs[(regressedData-outputTest)/outputTest]]*100;*)
(*medDiff=Median[Abs[(regressedData-outputTest)]];*)
(**)
(*{pm["StandardDeviation"],pm["MeanDeviation"],medDiff,meanPercentDiff}*)


(* ::Input:: *)
(*range=Max[Join[outputTest,regressedData]]-Min[Join[outputTest,regressedData]];*)
(*aMin=Min[Join[outputTest,regressedData]]-0.05*range;*)
(*aMax=Max[Join[outputTest,regressedData]]+0.05*range;*)
(**)
(*Show[*)
(*ListPlot[*)
(*Table[*)
(*Tooltip[*)
(*{regressedData[[i]],outputTest[[i]]},*)
(*Column[*)
(*{*)
(*Keys[testSet][[i]],*)
(*Row[{"Predicted: " ,regressedData[[i]]," K"}],*)
(*Row[{"Actual: ",outputTest[[i]]," K"}](*,*)
(*testSet[[i]]["BlackStructureDiagram"]*)*)
(*}*)
(*]*)
(*],*)
(*{i,1,Length[testSet]}],*)
(*PlotRange->{{aMin,aMax},{aMin,aMax}},*)
(*AspectRatio->1,*)
(*AxesLabel->{"Predicted Value","Actual Value"},*)
(*LabelStyle->Large*)
(*],*)
(*Graphics[{Dashed,Red,Line[{{aMin,aMin},{aMax,aMax}}]}]*)
(*]*)
(*pm["ResidualHistogram"]*)


(* ::Subsection::Closed:: *)
(*Heat of Fusion*)


(* ::Input:: *)
(*fileLoc=NotebookDirectory[];*)
(*nFeat=250;*)
(*tempfile=StringJoin[fileLoc,"FinalSet.wl"];*)
(*Get[tempfile];*)
(*totalSet=RandomSample[totalSet,Length[totalSet]];*)
(**)
(*requiredProperties[A_]:=And[*)
(*						Not[MissingQ[A["HeatFus"]]],*)
(*						QuantityQ[A["HeatFus"]]								*)
(*						]*)
(**)
(*totalSet=Select[totalSet,requiredProperties[#]&];*)
(*totalSet=RandomSample[totalSet,Length[totalSet]];*)
(**)
(*Lset=Length[totalSet];*)
(**)
(*trainSet=totalSet[[1;;Round[0.7*Lset]]];*)
(*testSet=totalSet[[Round[0.7*Lset]+1;;Round[0.85*Lset]]];*)
(*validSet=totalSet[[Round[0.85*Lset]+1;;]];*)


(* ::Input:: *)
(*hashesTrain=Table[trainSet[[i]]["Hashes"],{i,1,Length[trainSet]}];*)
(*hashesTest=Table[testSet[[i]]["Hashes"],{i,1,Length[testSet]}];*)
(*hashesValid=Table[validSet[[i]]["Hashes"],{i,1,Length[validSet]}];*)
(**)
(*flatHashes=Flatten[DeleteDuplicates/@hashesTrain];*)
(*commonHashes=SortBy[Tally[flatHashes],-#[[2]]&];*)
(**)
(*(*featureList=#[[2]]&/@Select[commonHashes,#[[2]]>100&];*)*)
(*featureList=Commonest[flatHashes,nFeat];*)
(**)
(*groupsTrain=Table[Count[hashesTrain[[i]],featureList[[j]]],{i,1,Length[hashesTrain]},{j,1,Length[featureList]}];*)
(*groupsTest=Table[Count[hashesTest[[i]],featureList[[j]]],{i,1,Length[hashesTest]},{j,1,Length[featureList]}];*)
(*groupsValid=Table[Count[hashesValid[[i]],featureList[[j]]],{i,1,Length[hashesValid]},{j,1,Length[featureList]}];*)
(**)
(*atomTalliesTrain=Table[trainSet[[i]]["AtomTally"],{i,1,Length[trainSet]}];*)
(*atomTalliesTest=Table[testSet[[i]]["AtomTally"],{i,1,Length[testSet]}];*)
(*atomTalliesValid=Table[validSet[[i]]["AtomTally"],{i,1,Length[validSet]}];*)
(**)
(*allInputsTrain=Table[*)
(*				Flatten[*)
(*					{groupsTrain[[i]],*)
(*					trainSet[[i]]["Cis"],*)
(*					trainSet[[i]]["Trans"],*)
(*					trainSet[[i]]["BondTally"],*)
(*					trainSet[[i]]["TopoFeatures"],*)
(*					trainSet[[i]]["Geom"],*)
(*					Total[Abs[trainSet[[i]]["FormalCharges"]]],*)
(*					QuantityMagnitude[trainSet[[i]]["TopologicalPolarSurfaceArea"]],*)
(*					trainSet[[i]]["NetCharge"],*)
(*					trainSet[[i]]["RotatableBondCount"],*)
(*					trainSet[[i]]["HBondAcceptorCount"],*)
(*					trainSet[[i]]["HBondDonorCount"],*)
(*					trainSet[[i]]["PrincipalMom"],*)
(*					QuantityMagnitude[trainSet[[i]]["MolarMass"]],*)
(*					QuantityMagnitude[trainSet[[i]]["MolarMass"]]/Total[atomTalliesTrain[[i]]],*)
(*					atomTalliesTrain[[i]]}*)
(*				],*)
(*				{i,1,Length[trainSet]}];*)
(**)
(*allInputsTest=Table[*)
(*				Flatten[*)
(*					{groupsTest[[i]],*)
(*					testSet[[i]]["Cis"],*)
(*					testSet[[i]]["Trans"],*)
(*					testSet[[i]]["BondTally"],*)
(*					testSet[[i]]["TopoFeatures"],*)
(*					testSet[[i]]["Geom"],*)
(*					Total[Abs[testSet[[i]]["FormalCharges"]]],*)
(*					QuantityMagnitude[testSet[[i]]["TopologicalPolarSurfaceArea"]],*)
(*					testSet[[i]]["NetCharge"],*)
(*					testSet[[i]]["RotatableBondCount"],*)
(*					testSet[[i]]["HBondAcceptorCount"],*)
(*					testSet[[i]]["HBondDonorCount"],*)
(*					testSet[[i]]["PrincipalMom"],*)
(*					QuantityMagnitude[testSet[[i]]["MolarMass"]],*)
(*					QuantityMagnitude[testSet[[i]]["MolarMass"]]/Total[atomTalliesTest[[i]]],*)
(*					atomTalliesTest[[i]]}*)
(*					],*)
(*					{i,1,Length[testSet]}];*)
(*					*)
(*allInputsValid=Table[*)
(*				Flatten[*)
(*					{groupsValid[[i]],*)
(*					validSet[[i]]["Cis"],*)
(*					validSet[[i]]["Trans"],*)
(*					validSet[[i]]["BondTally"],*)
(*					validSet[[i]]["TopoFeatures"],*)
(*					validSet[[i]]["Geom"],*)
(*					Total[Abs[validSet[[i]]["FormalCharges"]]],*)
(*					QuantityMagnitude[validSet[[i]]["TopologicalPolarSurfaceArea"]],*)
(*					validSet[[i]]["NetCharge"],*)
(*					validSet[[i]]["RotatableBondCount"],*)
(*					validSet[[i]]["HBondAcceptorCount"],*)
(*					validSet[[i]]["HBondDonorCount"],*)
(*					validSet[[i]]["PrincipalMom"],*)
(*					QuantityMagnitude[validSet[[i]]["MolarMass"]],*)
(*					QuantityMagnitude[validSet[[i]]["MolarMass"]]/Total[atomTalliesValid[[i]]],*)
(*					atomTalliesValid[[i]]}*)
(*					],*)
(*					{i,1,Length[validSet]}];*)
(**)
(**)
(*outputTrain=Table[*)
(*				QuantityMagnitude[*)
(*					UnitConvert[*)
(*						trainSet[[i]]["HeatFus"],*)
(*						"Kilojoules"/"Moles"*)
(*						]*)
(*					],*)
(*				{i,1,Length[trainSet]}];*)
(**)
(*outputTest=Table[*)
(*				QuantityMagnitude[*)
(*					UnitConvert[*)
(*						testSet[[i]]["HeatFus"],*)
(*						"Kilojoules"/"Moles"*)
(*						]*)
(*					],*)
(*				{i,1,Length[testSet]}];*)
(*				*)
(*outputValid=Table[*)
(*				QuantityMagnitude[*)
(*					UnitConvert[*)
(*						validSet[[i]]["HeatFus"],*)
(*						"Kilojoules"/"Moles"*)
(*						]*)
(*					],*)
(*				{i,1,Length[validSet]}];*)
(*				*)
(*					*)
(*trainData=Thread[allInputsTrain-> outputTrain];*)
(*testData=Thread[allInputsTest-> outputTest];*)
(*validData=Thread[allInputsValid-> outputValid];*)


(* ::Input:: *)
(*Clear[p];Clear[pm];p=Predict[trainData,ValidationSet->validData,FeatureTypes->"NumericalVector",PerformanceGoal->"Quality",Method->"RandomForest"];*)


(* ::Input:: *)
(*pm=PredictorMeasurements[p,testData];*)
(*regressedData=p[allInputsTest];*)
(**)
(**)
(**)
(*meanPercentDiff=Mean[Abs[(regressedData-outputTest)/outputTest]]*100;*)
(*medDiff=Median[Abs[(regressedData-outputTest)]];*)
(**)
(*{pm["StandardDeviation"],pm["MeanDeviation"],medDiff}*)


(* ::Input:: *)
(*range=Max[Join[outputTest,regressedData]]-Min[Join[outputTest,regressedData]];*)
(*aMin=Min[Join[outputTest,regressedData]]-0.05*range;*)
(*aMax=Max[Join[outputTest,regressedData]]+0.05*range;*)
(**)
(*Show[*)
(*ListPlot[*)
(*Table[*)
(*Tooltip[*)
(*{regressedData[[i]],outputTest[[i]]},*)
(*Column[*)
(*{*)
(*Keys[testSet][[i]],*)
(*Row[{"Predicted: " ,regressedData[[i]]," KJ/Mol"}],*)
(*Row[{"Actual: ",outputTest[[i]]," KJ/Mol"}](*,*)
(*testSet[[i]]["BlackStructureDiagram"]*)*)
(*}*)
(*]*)
(*],*)
(*{i,1,Length[testSet]}],*)
(*PlotRange->{{aMin,aMax},{aMin,aMax}},*)
(*AspectRatio->1,*)
(*AxesLabel->{"Predicted Value","Actual Value"},*)
(*LabelStyle->Large*)
(*],*)
(*Graphics[{Dashed,Red,Line[{{aMin,aMin},{aMax,aMax}}]}]*)
(*]*)
(*pm["ResidualHistogram"]*)


(* ::Subsection::Closed:: *)
(*Heat of Vaporization*)


(* ::Input:: *)
(*fileLoc=NotebookDirectory[];*)
(*nFeat=250;*)
(*tempfile=StringJoin[fileLoc,"FinalSet.wl"];*)
(*Get[tempfile];*)
(*totalSet=RandomSample[totalSet,Length[totalSet]];*)
(**)
(*requiredProperties[A_]:=And[*)
(*						Not[MissingQ[A["HeatVap"]]],*)
(*						QuantityQ[A["HeatVap"]]								*)
(*						]*)
(**)
(*totalSet=Select[totalSet,requiredProperties[#]&];*)
(*totalSet=RandomSample[totalSet,Length[totalSet]];*)
(**)
(*Lset=Length[totalSet];*)
(**)
(*trainSet=totalSet[[1;;Round[0.7*Lset]]];*)
(*testSet=totalSet[[Round[0.7*Lset]+1;;Round[0.85*Lset]]];*)
(*validSet=totalSet[[Round[0.85*Lset]+1;;]];*)


(* ::Input:: *)
(*hashesTrain=Table[trainSet[[i]]["Hashes"],{i,1,Length[trainSet]}];*)
(*hashesTest=Table[testSet[[i]]["Hashes"],{i,1,Length[testSet]}];*)
(*hashesValid=Table[validSet[[i]]["Hashes"],{i,1,Length[validSet]}];*)
(**)
(*flatHashes=Flatten[DeleteDuplicates/@hashesTrain];*)
(*commonHashes=SortBy[Tally[flatHashes],-#[[2]]&];*)
(**)
(*(*featureList=#[[2]]&/@Select[commonHashes,#[[2]]>100&];*)*)
(*featureList=Commonest[flatHashes,nFeat];*)
(**)
(*groupsTrain=Table[Count[hashesTrain[[i]],featureList[[j]]],{i,1,Length[hashesTrain]},{j,1,Length[featureList]}];*)
(*groupsTest=Table[Count[hashesTest[[i]],featureList[[j]]],{i,1,Length[hashesTest]},{j,1,Length[featureList]}];*)
(*groupsValid=Table[Count[hashesValid[[i]],featureList[[j]]],{i,1,Length[hashesValid]},{j,1,Length[featureList]}];*)
(**)
(*atomTalliesTrain=Table[trainSet[[i]]["AtomTally"],{i,1,Length[trainSet]}];*)
(*atomTalliesTest=Table[testSet[[i]]["AtomTally"],{i,1,Length[testSet]}];*)
(*atomTalliesValid=Table[validSet[[i]]["AtomTally"],{i,1,Length[validSet]}];*)
(**)
(*allInputsTrain=Table[*)
(*				Flatten[*)
(*					{groupsTrain[[i]],*)
(*					trainSet[[i]]["Cis"],*)
(*					trainSet[[i]]["Trans"],*)
(*					trainSet[[i]]["BondTally"],*)
(*					trainSet[[i]]["TopoFeatures"],*)
(*					trainSet[[i]]["Geom"],*)
(*					Total[Abs[trainSet[[i]]["FormalCharges"]]],*)
(*					QuantityMagnitude[trainSet[[i]]["TopologicalPolarSurfaceArea"]],*)
(*					trainSet[[i]]["NetCharge"],*)
(*					trainSet[[i]]["RotatableBondCount"],*)
(*					trainSet[[i]]["HBondAcceptorCount"],*)
(*					trainSet[[i]]["HBondDonorCount"],*)
(*					trainSet[[i]]["PrincipalMom"],*)
(*					QuantityMagnitude[trainSet[[i]]["MolarMass"]],*)
(*					QuantityMagnitude[trainSet[[i]]["MolarMass"]]/Total[atomTalliesTrain[[i]]],*)
(*					atomTalliesTrain[[i]]}*)
(*				],*)
(*				{i,1,Length[trainSet]}];*)
(**)
(*allInputsTest=Table[*)
(*				Flatten[*)
(*					{groupsTest[[i]],*)
(*					testSet[[i]]["Cis"],*)
(*					testSet[[i]]["Trans"],*)
(*					testSet[[i]]["BondTally"],*)
(*					testSet[[i]]["TopoFeatures"],*)
(*					testSet[[i]]["Geom"],*)
(*					Total[Abs[testSet[[i]]["FormalCharges"]]],*)
(*					QuantityMagnitude[testSet[[i]]["TopologicalPolarSurfaceArea"]],*)
(*					testSet[[i]]["NetCharge"],*)
(*					testSet[[i]]["RotatableBondCount"],*)
(*					testSet[[i]]["HBondAcceptorCount"],*)
(*					testSet[[i]]["HBondDonorCount"],*)
(*					testSet[[i]]["PrincipalMom"],*)
(*					QuantityMagnitude[testSet[[i]]["MolarMass"]],*)
(*					QuantityMagnitude[testSet[[i]]["MolarMass"]]/Total[atomTalliesTest[[i]]],*)
(*					atomTalliesTest[[i]]}*)
(*					],*)
(*					{i,1,Length[testSet]}];*)
(*					*)
(*allInputsValid=Table[*)
(*				Flatten[*)
(*					{groupsValid[[i]],*)
(*					validSet[[i]]["Cis"],*)
(*					validSet[[i]]["Trans"],*)
(*					validSet[[i]]["BondTally"],*)
(*					validSet[[i]]["TopoFeatures"],*)
(*					validSet[[i]]["Geom"],*)
(*					Total[Abs[validSet[[i]]["FormalCharges"]]],*)
(*					QuantityMagnitude[validSet[[i]]["TopologicalPolarSurfaceArea"]],*)
(*					validSet[[i]]["NetCharge"],*)
(*					validSet[[i]]["RotatableBondCount"],*)
(*					validSet[[i]]["HBondAcceptorCount"],*)
(*					validSet[[i]]["HBondDonorCount"],*)
(*					validSet[[i]]["PrincipalMom"],*)
(*					QuantityMagnitude[validSet[[i]]["MolarMass"]],*)
(*					QuantityMagnitude[validSet[[i]]["MolarMass"]]/Total[atomTalliesValid[[i]]],*)
(*					atomTalliesValid[[i]]}*)
(*					],*)
(*					{i,1,Length[validSet]}];*)
(**)
(**)
(*outputTrain=Table[*)
(*				QuantityMagnitude[*)
(*					UnitConvert[*)
(*						trainSet[[i]]["HeatVap"],*)
(*						"Kilojoules"/"Moles"*)
(*						]*)
(*					],*)
(*				{i,1,Length[trainSet]}];*)
(**)
(*outputTest=Table[*)
(*				QuantityMagnitude[*)
(*					UnitConvert[*)
(*						testSet[[i]]["HeatVap"],*)
(*						"Kilojoules"/"Moles"*)
(*						]*)
(*					],*)
(*				{i,1,Length[testSet]}];*)
(*				*)
(*outputValid=Table[*)
(*				QuantityMagnitude[*)
(*					UnitConvert[*)
(*						validSet[[i]]["HeatVap"],*)
(*						"Kilojoules"/"Moles"*)
(*						]*)
(*					],*)
(*				{i,1,Length[validSet]}];*)
(*				*)
(*					*)
(*trainData=Thread[allInputsTrain-> outputTrain];*)
(*testData=Thread[allInputsTest-> outputTest];*)
(*validData=Thread[allInputsValid-> outputValid];*)


(* ::Input:: *)
(*Clear[p];Clear[pm];p=Predict[trainData,ValidationSet->validData,FeatureTypes->"NumericalVector",PerformanceGoal->"Quality",Method->"RandomForest"];*)


(* ::Input:: *)
(*pm=PredictorMeasurements[p,testData];*)
(*regressedData=p[allInputsTest];*)
(**)
(**)
(**)
(*meanPercentDiff=Mean[Abs[(regressedData-outputTest)/outputTest]]*100;*)
(*medDiff=Median[Abs[(regressedData-outputTest)]];*)
(**)
(*{pm["StandardDeviation"],pm["MeanDeviation"],medDiff}*)


(* ::Input:: *)
(*range=Max[Join[outputTest,regressedData]]-Min[Join[outputTest,regressedData]];*)
(*aMin=Min[Join[outputTest,regressedData]]-0.05*range;*)
(*aMax=Max[Join[outputTest,regressedData]]+0.05*range;*)
(**)
(*Show[*)
(*ListPlot[*)
(*Table[*)
(*Tooltip[*)
(*{regressedData[[i]],outputTest[[i]]},*)
(*Column[*)
(*{*)
(*Keys[testSet][[i]],*)
(*Row[{"Predicted: " ,regressedData[[i]]," KJ/Mol"}],*)
(*Row[{"Actual: ",outputTest[[i]]," KJ/Mol"}](*,*)
(*testSet[[i]]["BlackStructureDiagram"]*)*)
(*}*)
(*]*)
(*],*)
(*{i,1,Length[testSet]}],*)
(*PlotRange->{{aMin,aMax},{aMin,aMax}},*)
(*AspectRatio->1,*)
(*AxesLabel->{"Predicted Value","Actual Value"},*)
(*PlotLabel->"Heat of Vaporization",*)
(*LabelStyle->Large*)
(*],*)
(*Graphics[{Dashed,Red,Line[{{aMin,aMin},{aMax,aMax}}]}]*)
(*]*)
(*pm["ResidualHistogram"]*)


(* ::Subsection::Closed:: *)
(*Heat of Combustion*)


(* ::Input:: *)
(*fileLoc=NotebookDirectory[];*)
(*nFeat=250;*)
(*tempfile=StringJoin[fileLoc,"FinalSet.wl"];*)
(*Get[tempfile];*)
(*totalSet=RandomSample[totalSet,Length[totalSet]];*)
(**)
(*requiredProperties[A_]:=And[*)
(*						Not[MissingQ[A["HeatComb"]]],*)
(*						QuantityQ[A["HeatComb"]]							*)
(*						]*)
(**)
(*totalSet=Select[totalSet,requiredProperties[#]&];*)
(*totalSet=RandomSample[totalSet,Length[totalSet]];*)
(**)
(*Lset=Length[totalSet];*)
(**)
(*trainSet=totalSet[[1;;Round[0.7*Lset]]];*)
(*testSet=totalSet[[Round[0.7*Lset]+1;;Round[0.85*Lset]]];*)
(*validSet=totalSet[[Round[0.85*Lset]+1;;]];*)


(* ::Input:: *)
(*hashesTrain=Table[trainSet[[i]]["Hashes"],{i,1,Length[trainSet]}];*)
(*hashesTest=Table[testSet[[i]]["Hashes"],{i,1,Length[testSet]}];*)
(*hashesValid=Table[validSet[[i]]["Hashes"],{i,1,Length[validSet]}];*)
(**)
(*flatHashes=Flatten[DeleteDuplicates/@hashesTrain];*)
(*commonHashes=SortBy[Tally[flatHashes],-#[[2]]&];*)
(**)
(*(*featureList=#[[2]]&/@Select[commonHashes,#[[2]]>100&];*)*)
(*featureList=Commonest[flatHashes,nFeat];*)
(**)
(*groupsTrain=Table[Count[hashesTrain[[i]],featureList[[j]]],{i,1,Length[hashesTrain]},{j,1,Length[featureList]}];*)
(*groupsTest=Table[Count[hashesTest[[i]],featureList[[j]]],{i,1,Length[hashesTest]},{j,1,Length[featureList]}];*)
(*groupsValid=Table[Count[hashesValid[[i]],featureList[[j]]],{i,1,Length[hashesValid]},{j,1,Length[featureList]}];*)
(**)
(*atomTalliesTrain=Table[trainSet[[i]]["AtomTally"],{i,1,Length[trainSet]}];*)
(*atomTalliesTest=Table[testSet[[i]]["AtomTally"],{i,1,Length[testSet]}];*)
(*atomTalliesValid=Table[validSet[[i]]["AtomTally"],{i,1,Length[validSet]}];*)
(**)
(*allInputsTrain=Table[*)
(*				Flatten[*)
(*					{groupsTrain[[i]],*)
(*					trainSet[[i]]["Cis"],*)
(*					trainSet[[i]]["Trans"],*)
(*					trainSet[[i]]["BondTally"],*)
(*					trainSet[[i]]["TopoFeatures"],*)
(*					trainSet[[i]]["Geom"],*)
(*					Total[Abs[trainSet[[i]]["FormalCharges"]]],*)
(*					QuantityMagnitude[trainSet[[i]]["TopologicalPolarSurfaceArea"]],*)
(*					trainSet[[i]]["NetCharge"],*)
(*					trainSet[[i]]["RotatableBondCount"],*)
(*					trainSet[[i]]["HBondAcceptorCount"],*)
(*					trainSet[[i]]["HBondDonorCount"],*)
(*					trainSet[[i]]["PrincipalMom"],*)
(*					QuantityMagnitude[trainSet[[i]]["MolarMass"]],*)
(*					QuantityMagnitude[trainSet[[i]]["MolarMass"]]/Total[atomTalliesTrain[[i]]],*)
(*					atomTalliesTrain[[i]]}*)
(*				],*)
(*				{i,1,Length[trainSet]}];*)
(**)
(*allInputsTest=Table[*)
(*				Flatten[*)
(*					{groupsTest[[i]],*)
(*					testSet[[i]]["Cis"],*)
(*					testSet[[i]]["Trans"],*)
(*					testSet[[i]]["BondTally"],*)
(*					testSet[[i]]["TopoFeatures"],*)
(*					testSet[[i]]["Geom"],*)
(*					Total[Abs[testSet[[i]]["FormalCharges"]]],*)
(*					QuantityMagnitude[testSet[[i]]["TopologicalPolarSurfaceArea"]],*)
(*					testSet[[i]]["NetCharge"],*)
(*					testSet[[i]]["RotatableBondCount"],*)
(*					testSet[[i]]["HBondAcceptorCount"],*)
(*					testSet[[i]]["HBondDonorCount"],*)
(*					testSet[[i]]["PrincipalMom"],*)
(*					QuantityMagnitude[testSet[[i]]["MolarMass"]],*)
(*					QuantityMagnitude[testSet[[i]]["MolarMass"]]/Total[atomTalliesTest[[i]]],*)
(*					atomTalliesTest[[i]]}*)
(*					],*)
(*					{i,1,Length[testSet]}];*)
(*					*)
(*allInputsValid=Table[*)
(*				Flatten[*)
(*					{groupsValid[[i]],*)
(*					validSet[[i]]["Cis"],*)
(*					validSet[[i]]["Trans"],*)
(*					validSet[[i]]["BondTally"],*)
(*					validSet[[i]]["TopoFeatures"],*)
(*					validSet[[i]]["Geom"],*)
(*					Total[Abs[validSet[[i]]["FormalCharges"]]],*)
(*					QuantityMagnitude[validSet[[i]]["TopologicalPolarSurfaceArea"]],*)
(*					validSet[[i]]["NetCharge"],*)
(*					validSet[[i]]["RotatableBondCount"],*)
(*					validSet[[i]]["HBondAcceptorCount"],*)
(*					validSet[[i]]["HBondDonorCount"],*)
(*					validSet[[i]]["PrincipalMom"],*)
(*					QuantityMagnitude[validSet[[i]]["MolarMass"]],*)
(*					QuantityMagnitude[validSet[[i]]["MolarMass"]]/Total[atomTalliesValid[[i]]],*)
(*					atomTalliesValid[[i]]}*)
(*					],*)
(*					{i,1,Length[validSet]}];*)
(**)
(**)
(*outputTrain=Table[*)
(*				QuantityMagnitude[*)
(*					UnitConvert[*)
(*						trainSet[[i]]["HeatComb"],*)
(*						"Kilojoules"/"Moles"*)
(*						]*)
(*					],*)
(*				{i,1,Length[trainSet]}];*)
(**)
(*outputTest=Table[*)
(*				QuantityMagnitude[*)
(*					UnitConvert[*)
(*						testSet[[i]]["HeatComb"],*)
(*						"Kilojoules"/"Moles"*)
(*						]*)
(*					],*)
(*				{i,1,Length[testSet]}];*)
(*				*)
(*outputValid=Table[*)
(*				QuantityMagnitude[*)
(*					UnitConvert[*)
(*						validSet[[i]]["HeatComb"],*)
(*						"Kilojoules"/"Moles"*)
(*						]*)
(*					],*)
(*				{i,1,Length[validSet]}];*)
(*				*)
(*					*)
(*trainData=Thread[allInputsTrain-> outputTrain];*)
(*testData=Thread[allInputsTest-> outputTest];*)
(*validData=Thread[allInputsValid-> outputValid];*)


(* ::Input:: *)
(*Clear[p];Clear[pm];p=Predict[trainData,ValidationSet->validData,FeatureTypes->"NumericalVector",PerformanceGoal->"Quality",Method->"RandomForest"];*)


(* ::Input:: *)
(*pm=PredictorMeasurements[p,testData];*)
(*regressedData=p[allInputsTest];*)
(**)
(**)
(**)
(*meanPercentDiff=Mean[Abs[(regressedData-outputTest)/outputTest]]*100;*)
(*medDiff=Median[Abs[(regressedData-outputTest)]];*)
(**)
(*{pm["StandardDeviation"],pm["MeanDeviation"],medDiff}*)


(* ::Input:: *)
(*range=Max[Join[outputTest,regressedData]]-Min[Join[outputTest,regressedData]];*)
(*aMin=Min[Join[outputTest,regressedData]]-0.05*range;*)
(*aMax=Max[Join[outputTest,regressedData]]+0.05*range;*)
(**)
(*Show[*)
(*ListPlot[*)
(*Table[*)
(*Tooltip[*)
(*{regressedData[[i]],outputTest[[i]]},*)
(*Column[*)
(*{*)
(*Keys[testSet][[i]],*)
(*Row[{"Predicted: " ,regressedData[[i]]," KJ/Mol"}],*)
(*Row[{"Actual: ",outputTest[[i]]," KJ/Mol"}](*,*)
(*testSet[[i]]["BlackStructureDiagram"]*)*)
(*}*)
(*]*)
(*],*)
(*{i,1,Length[testSet]}],*)
(*PlotRange->{{aMin,aMax},{aMin,aMax}},*)
(*AspectRatio->1,*)
(*AxesLabel->{"Predicted Value","Actual Value"},*)
(*LabelStyle->Large*)
(*],*)
(*Graphics[{Dashed,Red,Line[{{aMin,aMin},{aMax,aMax}}]}]*)
(*]*)
(*pm["ResidualHistogram"]*)


(* ::Subsection::Closed:: *)
(*Heat of Formation*)


(* ::Input:: *)
(*fileLoc=NotebookDirectory[];*)
(*nFeat=250;*)
(*tempfile=StringJoin[fileLoc,"FinalSet.wl"];*)
(*Get[tempfile];*)
(*totalSet=RandomSample[totalSet,Length[totalSet]];*)
(**)
(*requiredProperties[A_]:=And[*)
(*						Not[MissingQ[A["HeatComb"]]],*)
(*						QuantityQ[A["HeatComb"]],				*)
(**)
(*						Not[MissingQ[A["VertexTypes"]]],*)
(*						SubsetQ[{"C","O","H"},DeleteDuplicates[A["VertexTypes"]]],*)
(*						Length[DeleteDuplicates[A["VertexTypes"]]]>1,*)
(*						SubsetQ[A["VertexTypes"],{"C"}]*)
(*				*)
(*						]*)
(**)
(*totalSet=Select[totalSet,requiredProperties[#]&];*)
(*totalSet=RandomSample[totalSet,Length[totalSet]];*)
(**)
(*Lset=Length[totalSet];*)
(**)
(*trainSet=totalSet[[1;;Round[0.7*Lset]]];*)
(*testSet=totalSet[[Round[0.7*Lset]+1;;Round[0.85*Lset]]];*)
(*validSet=totalSet[[Round[0.85*Lset]+1;;]];*)


(* ::Input:: *)
(*heatH2O=-285.820;*)
(*heatCO2=-393.520;*)
(**)
(**)
(*hashesTrain=Table[trainSet[[i]]["Hashes"],{i,1,Length[trainSet]}];*)
(*hashesTest=Table[testSet[[i]]["Hashes"],{i,1,Length[testSet]}];*)
(*hashesValid=Table[validSet[[i]]["Hashes"],{i,1,Length[validSet]}];*)
(**)
(*flatHashes=Flatten[DeleteDuplicates/@hashesTrain];*)
(*commonHashes=SortBy[Tally[flatHashes],-#[[2]]&];*)
(**)
(*(*featureList=#[[2]]&/@Select[commonHashes,#[[2]]>100&];*)*)
(*featureList=Commonest[flatHashes,nFeat];*)
(**)
(*groupsTrain=Table[Count[hashesTrain[[i]],featureList[[j]]],{i,1,Length[hashesTrain]},{j,1,Length[featureList]}];*)
(*groupsTest=Table[Count[hashesTest[[i]],featureList[[j]]],{i,1,Length[hashesTest]},{j,1,Length[featureList]}];*)
(*groupsValid=Table[Count[hashesValid[[i]],featureList[[j]]],{i,1,Length[hashesValid]},{j,1,Length[featureList]}];*)
(**)
(*atomTalliesTrain=Table[trainSet[[i]]["AtomTally"],{i,1,Length[trainSet]}];*)
(*atomTalliesTest=Table[testSet[[i]]["AtomTally"],{i,1,Length[testSet]}];*)
(*atomTalliesValid=Table[validSet[[i]]["AtomTally"],{i,1,Length[validSet]}];*)
(**)
(*allInputsTrain=Table[*)
(*				Flatten[*)
(*					{groupsTrain[[i]],*)
(*					trainSet[[i]]["Cis"],*)
(*					trainSet[[i]]["Trans"],*)
(*					trainSet[[i]]["BondTally"],*)
(*					trainSet[[i]]["TopoFeatures"],*)
(*					trainSet[[i]]["Geom"],*)
(*					Total[Abs[trainSet[[i]]["FormalCharges"]]],*)
(*					QuantityMagnitude[trainSet[[i]]["TopologicalPolarSurfaceArea"]],*)
(*					trainSet[[i]]["NetCharge"],*)
(*					trainSet[[i]]["RotatableBondCount"],*)
(*					trainSet[[i]]["HBondAcceptorCount"],*)
(*					trainSet[[i]]["HBondDonorCount"],*)
(*					trainSet[[i]]["PrincipalMom"],*)
(*					QuantityMagnitude[trainSet[[i]]["MolarMass"]],*)
(*					QuantityMagnitude[trainSet[[i]]["MolarMass"]]/Total[atomTalliesTrain[[i]]],*)
(*					atomTalliesTrain[[i]]}*)
(*				],*)
(*				{i,1,Length[trainSet]}];*)
(**)
(*allInputsTest=Table[*)
(*				Flatten[*)
(*					{groupsTest[[i]],*)
(*					testSet[[i]]["Cis"],*)
(*					testSet[[i]]["Trans"],*)
(*					testSet[[i]]["BondTally"],*)
(*					testSet[[i]]["TopoFeatures"],*)
(*					testSet[[i]]["Geom"],*)
(*					Total[Abs[testSet[[i]]["FormalCharges"]]],*)
(*					QuantityMagnitude[testSet[[i]]["TopologicalPolarSurfaceArea"]],*)
(*					testSet[[i]]["NetCharge"],*)
(*					testSet[[i]]["RotatableBondCount"],*)
(*					testSet[[i]]["HBondAcceptorCount"],*)
(*					testSet[[i]]["HBondDonorCount"],*)
(*					testSet[[i]]["PrincipalMom"],*)
(*					QuantityMagnitude[testSet[[i]]["MolarMass"]],*)
(*					QuantityMagnitude[testSet[[i]]["MolarMass"]]/Total[atomTalliesTest[[i]]],*)
(*					atomTalliesTest[[i]]}*)
(*					],*)
(*					{i,1,Length[testSet]}];*)
(*					*)
(*allInputsValid=Table[*)
(*				Flatten[*)
(*					{groupsValid[[i]],*)
(*					validSet[[i]]["Cis"],*)
(*					validSet[[i]]["Trans"],*)
(*					validSet[[i]]["BondTally"],*)
(*					validSet[[i]]["TopoFeatures"],*)
(*					validSet[[i]]["Geom"],*)
(*					Total[Abs[validSet[[i]]["FormalCharges"]]],*)
(*					QuantityMagnitude[validSet[[i]]["TopologicalPolarSurfaceArea"]],*)
(*					validSet[[i]]["NetCharge"],*)
(*					validSet[[i]]["RotatableBondCount"],*)
(*					validSet[[i]]["HBondAcceptorCount"],*)
(*					validSet[[i]]["HBondDonorCount"],*)
(*					validSet[[i]]["PrincipalMom"],*)
(*					QuantityMagnitude[validSet[[i]]["MolarMass"]],*)
(*					QuantityMagnitude[validSet[[i]]["MolarMass"]]/Total[atomTalliesValid[[i]]],*)
(*					atomTalliesValid[[i]]}*)
(*					],*)
(*					{i,1,Length[validSet]}];*)
(**)
(**)
(*outputTrain=Table[*)
(*			QuantityMagnitude[*)
(*				UnitConvert[trainSet[[i]]["HeatComb"]],"Kilojoules"/"Moles"*)
(*				]+*)
(*			atomTalliesTrain[[i,1]]/2*heatH2O+*)
(*			atomTalliesTrain[[i,2]]*heatCO2,*)
(*				{i,1,Length[trainSet]}];*)
(**)
(*outputTest=Table[*)
(*			QuantityMagnitude[*)
(*				UnitConvert[testSet[[i]]["HeatComb"]],"Kilojoules"/"Moles"*)
(*				]+*)
(*			atomTalliesTest[[i,1]]/2*heatH2O+*)
(*			atomTalliesTest[[i,2]]*heatCO2,*)
(*				{i,1,Length[testSet]}];*)
(**)
(*outputValid=Table[*)
(*			QuantityMagnitude[*)
(*				UnitConvert[validSet[[i]]["HeatComb"]],"Kilojoules"/"Moles"*)
(*				]+*)
(*			atomTalliesValid[[i,1]]/2*heatH2O+*)
(*			atomTalliesValid[[i,2]]*heatCO2,*)
(*				{i,1,Length[validSet]}];*)
(*					*)
(*trainData=Thread[allInputsTrain-> outputTrain];*)
(*testData=Thread[allInputsTest-> outputTest];*)
(*validData=Thread[allInputsValid-> outputValid];*)


(* ::Input:: *)
(*Clear[p];Clear[pm];p=Predict[trainData,ValidationSet->validData,FeatureTypes->"NumericalVector",PerformanceGoal->"Quality",Method->"RandomForest"];*)


(* ::Input:: *)
(*pm=PredictorMeasurements[p,testData];*)
(*regressedData=p[allInputsTest];*)
(**)
(**)
(**)
(*meanPercentDiff=Mean[Abs[(regressedData-outputTest)/outputTest]]*100;*)
(*medDiff=Median[Abs[(regressedData-outputTest)]];*)
(**)
(*{pm["StandardDeviation"],pm["MeanDeviation"],medDiff}*)


(* ::Input:: *)
(*range=Max[Join[outputTest,regressedData]]-Min[Join[outputTest,regressedData]];*)
(*aMin=Min[Join[outputTest,regressedData]]-0.05*range;*)
(*aMax=Max[Join[outputTest,regressedData]]+0.05*range;*)
(**)
(*Show[*)
(*ListPlot[*)
(*Table[*)
(*Tooltip[*)
(*{regressedData[[i]],outputTest[[i]]},*)
(*Column[*)
(*{*)
(*Keys[testSet][[i]],*)
(*Row[{"Predicted: " ,regressedData[[i]]," KJ/Mol"}],*)
(*Row[{"Actual: ",outputTest[[i]]," KJ/Mol"}](*,*)
(*testSet[[i]]["BlackStructureDiagram"]*)*)
(*}*)
(*]*)
(*],*)
(*{i,1,Length[testSet]}],*)
(*PlotRange->{{aMin,aMax},{aMin,aMax}},*)
(*AspectRatio->1,*)
(*AxesLabel->{"Predicted Value","Actual Value"},*)
(*LabelStyle->Large*)
(*],*)
(*Graphics[{Dashed,Red,Line[{{aMin,aMin},{aMax,aMax}}]}]*)
(*]*)
(*pm["ResidualHistogram"]*)


(* ::Section::Closed:: *)
(*References*)


(* ::Item:: *)
(*Libretexts. "Trouton's Rule." Chemistry LibreTexts. Libretexts, 09 Apr. 2017. Web. 05 July 2017. <https://chem.libretexts.org/Core/Physical_and_Theoretical_Chemistry/Thermodynamics/Introduction_to_Thermodynamics/Trouton's_rule>.*)


(* ::Item:: *)
(*"Theory: QSAR+ Descriptors." Accelrys, n.d. Web. 04 July 2017. <http://www.ifm.liu.se/compchem/msi/doc/life/cerius46/qsar/theory_descriptors.html>.*)


(* ::Item:: *)
(*Katritzky, Alan, Mati Karelson, and Ruslan Petrukhin. "CODESSA PRO Classes of Descriptors." CODESSA PRO. N.p., n.d. Web. <http://www.codessa-pro.com/descriptors/index.htm>.*)


(* ::Item:: *)
(*"Molar Enthalpy of Formation of Various Substances." Ohio University, n.d. Web. 04 July 2017. <http://www.ohio.edu/mechanical/thermo/property_tables/combustion/Enth_Formation.html>.*)


(* ::Item:: *)
(*Winter, Mark. "The Periodic Table of the Elements." The Periodic Table of the Elements by WebElements. N.p., n.d. Web. 04 July 2017. <https://www.webelements.com/>.*)


(* ::Item:: *)
(*Lazz\[UAcute]s, Juan A."Neural Network Based on Quantum Chemistry for Predicting Melting Point of Organic Compounds." Chinese Journal of Chemical Physics, vol.22, no.1, 2009, pp.19 - 26.*)


(* ::Item:: *)
(*Rogers, David, and Mathew Hahn. "Extended-Connectivity Fingerprints." Journal of Chemical Information and Modeling, vol. 50, no. 5, 2010, pp. 742.*)
(**)
