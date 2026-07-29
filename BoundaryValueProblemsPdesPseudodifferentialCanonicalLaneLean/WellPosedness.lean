import canonicalLaneMathlib.AdmissibleClass
import PseudodifferentialOperators
import BoundaryConditions

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean

structure WellPosednessPackage (O : BVPPAdmittedObject)
    (P : PseudodifferentialOperatorPackage O) (B : BoundaryConditionPackage O) where
  uniqueSolution : Prop
  continuousDependence : Prop
  regularityGain : Prop
  aPrioriEstimate : Prop
  uniqueSolutionClosed : uniqueSolution
  continuousDependenceClosed : continuousDependence
  regularityGainClosed : regularityGain
  aPrioriEstimateClosed : aPrioriEstimate

structure WellPosednessEvidence (O : BVPPAdmittedObject)
    (P : PseudodifferentialOperatorPackage O) (B : BoundaryConditionPackage O)
    (W : WellPosednessPackage O P B) where
  uniqueSolutionTerm : W.uniqueSolutionClosed
  continuousDependenceTerm : W.continuousDependenceClosed
  regularityGainTerm : W.regularityGainClosed
  aPrioriEstimateTerm : W.aPrioriEstimateClosed

def WellPosednessClosed (O : BVPPAdmittedObject)
    (P : PseudodifferentialOperatorPackage O) (B : BoundaryConditionPackage O)
    (W : WellPosednessPackage O P B) : Prop :=
  W.uniqueSolution ∧ W.continuousDependence ∧ W.regularityGain ∧ W.aPrioriEstimate

theorem well_posedness_closed_from_evidence
    (O : BVPPAdmittedObject) (P : PseudodifferentialOperatorPackage O) (B : BoundaryConditionPackage O)
    (W : WellPosednessPackage O P B) (E : WellPosednessEvidence O P B W) :
    WellPosednessClosed O P B W := by
  exact And.intro E.uniqueSolutionTerm (And.intro E.continuousDependenceTerm (And.intro E.regularityGainTerm E.aPrioriEstimateTerm))

end BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean
end HautevilleHouse
