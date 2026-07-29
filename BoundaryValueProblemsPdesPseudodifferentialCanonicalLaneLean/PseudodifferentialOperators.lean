import canonicalLaneMathlib.AdmissibleClass
import BVPPAdmittedObject

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean

structure PseudodifferentialOperatorPackage (O : BVPPAdmittedObject) where
  symbolClass : Type
  ellipticCondition : Prop
  parametrixExists : Prop
  operatorRegularity : Prop
  symbolClassClosed : symbolClass
  ellipticConditionClosed : ellipticCondition
  parametrixExistsClosed : parametrixExists
  operatorRegularityClosed : operatorRegularity

structure PseudodifferentialOperatorEvidence (O : BVPPAdmittedObject) (P : PseudodifferentialOperatorPackage O) where
  symbolClassTerm : P.symbolClassClosed
  ellipticConditionTerm : P.ellipticConditionClosed
  parametrixExistsTerm : P.parametrixExistsClosed
  operatorRegularityTerm : P.operatorRegularityClosed

def PseudodifferentialOperatorClosed (O : BVPPAdmittedObject) (P : PseudodifferentialOperatorPackage O) : Prop :=
  P.symbolClass ∧ P.ellipticCondition ∧ P.parametrixExists ∧ P.operatorRegularity

theorem pseudodifferential_operator_closed_from_evidence
    (O : BVPPAdmittedObject) (P : PseudodifferentialOperatorPackage O)
    (E : PseudodifferentialOperatorEvidence O P) : PseudodifferentialOperatorClosed O P := by
  exact And.intro E.symbolClassTerm (And.intro E.ellipticConditionTerm (And.intro E.parametrixExistsTerm E.operatorRegularityTerm))

end BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean
end HautevilleHouse
