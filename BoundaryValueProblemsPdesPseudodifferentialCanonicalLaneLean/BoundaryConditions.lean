import canonicalLaneMathlib.AdmissibleClass
import BVPPAdmittedObject

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean

structure BoundaryConditionPackage (O : BVPPAdmittedObject) where
  boundaryType : Type
  lopatinskiCondition : Prop
  complementingCondition : Prop
  boundaryRegularity : Prop
  boundaryTypeClosed : boundaryType
  lopatinskiConditionClosed : lopatinskiCondition
  complementingConditionClosed : complementingCondition
  boundaryRegularityClosed : boundaryRegularity

structure BoundaryConditionEvidence (O : BVPPAdmittedObject) (B : BoundaryConditionPackage O) where
  boundaryTypeTerm : B.boundaryTypeClosed
  lopatinskiConditionTerm : B.lopatinskiConditionClosed
  complementingConditionTerm : B.complementingConditionClosed
  boundaryRegularityTerm : B.boundaryRegularityClosed

def BoundaryConditionClosed (O : BVPPAdmittedObject) (B : BoundaryConditionPackage O) : Prop :=
  B.boundaryType ∧ B.lopatinskiCondition ∧ B.complementingCondition ∧ B.boundaryRegularity

theorem boundary_condition_closed_from_evidence
    (O : BVPPAdmittedObject) (B : BoundaryConditionPackage O)
    (E : BoundaryConditionEvidence O B) : BoundaryConditionClosed O B := by
  exact And.intro E.boundaryTypeTerm (And.intro E.lopatinskiConditionTerm (And.intro E.complementingConditionTerm E.boundaryRegularityTerm))

end BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean
end HautevilleHouse
