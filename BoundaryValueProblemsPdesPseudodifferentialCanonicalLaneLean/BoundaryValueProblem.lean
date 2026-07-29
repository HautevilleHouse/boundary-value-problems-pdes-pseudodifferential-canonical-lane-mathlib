import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean

structure BoundaryCondition where
  conditionType : Type
  complementingCondition : Prop
  lopatinskiiCondition : Prop

structure BoundaryValueProblemPackage where
  interiorOperator : PseudodifferentialCalculusPackage
  boundaryCondition : BoundaryCondition
  solvabilityInSobolevSpaces : Prop
  regularityUpToBoundary : Prop
  indexComputed : Prop

structure BoundaryValueProblemEvidence (B : BoundaryValueProblemPackage) where
  solvabilityInSobolevSpacesClosed : B.solvabilityInSobolevSpaces
  regularityUpToBoundaryClosed : B.regularityUpToBoundary
  indexComputedClosed : B.indexComputed

def BoundaryValueProblemClosed (B : BoundaryValueProblemPackage) : Prop :=
  B.solvabilityInSobolevSpaces ∧ B.regularityUpToBoundary ∧ B.indexComputed

theorem boundary_value_problem_closed_from_evidence (B : BoundaryValueProblemPackage)
    (Ev : BoundaryValueProblemEvidence B) : BoundaryValueProblemClosed B := by
  exact And.intro Ev.solvabilityInSobolevSpacesClosed
    (And.intro Ev.regularityUpToBoundaryClosed Ev.indexComputedClosed)

end BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean
end HautevilleHouse