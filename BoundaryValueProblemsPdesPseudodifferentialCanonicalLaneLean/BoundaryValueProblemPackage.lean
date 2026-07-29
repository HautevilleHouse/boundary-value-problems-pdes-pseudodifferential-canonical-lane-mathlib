import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean

structure BoundaryValueProblemPackage where
  domain : Type u
  boundaryCondition : Prop
  ellipticRegularity : Prop
  indexFormula : Prop
  solutionSpace : Prop

structure BoundaryValueProblemEvidence (B : BoundaryValueProblemPackage) where
  boundaryConditionClosed : B.boundaryCondition
  ellipticRegularityClosed : B.ellipticRegularity
  indexFormulaClosed : B.indexFormula
  solutionSpaceClosed : B.solutionSpace

def BoundaryValueProblemClosed (B : BoundaryValueProblemPackage) : Prop :=
  B.boundaryCondition ∧ B.ellipticRegularity ∧ B.indexFormula ∧ B.solutionSpace

theorem boundary_value_problem_closed_from_evidence (B : BoundaryValueProblemPackage)
    (E : BoundaryValueProblemEvidence B) : BoundaryValueProblemClosed B := by
  exact And.intro E.boundaryConditionClosed (And.intro E.ellipticRegularityClosed
    (And.intro E.indexFormulaClosed E.solutionSpaceClosed))

end BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean
end HautevilleHouse