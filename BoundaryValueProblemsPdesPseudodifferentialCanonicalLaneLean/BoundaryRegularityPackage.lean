import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean

structure BoundaryRegularityPackage where
  interiorRegularity : Prop
  boundaryRegularity : Prop
  schauderEstimates : Prop
  parametrixConstruction : Prop

structure BoundaryRegularityEvidence (B : BoundaryRegularityPackage) where
  interiorRegularityClosed : B.interiorRegularity
  boundaryRegularityClosed : B.boundaryRegularity
  schauderEstimatesClosed : B.schauderEstimates
  parametrixConstructionClosed : B.parametrixConstruction

def BoundaryRegularityClosed (B : BoundaryRegularityPackage) : Prop :=
  B.interiorRegularity ∧ B.boundaryRegularity ∧ B.schauderEstimates ∧ B.parametrixConstruction

theorem boundary_regularity_closed_from_evidence
    (B : BoundaryRegularityPackage) (Ev : BoundaryRegularityEvidence B) :
    BoundaryRegularityClosed B := by
  exact And.intro Ev.interiorRegularityClosed
    (And.intro Ev.boundaryRegularityClosed
      (And.intro Ev.schauderEstimatesClosed Ev.parametrixConstructionClosed))

end BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean
end HautevilleHouse