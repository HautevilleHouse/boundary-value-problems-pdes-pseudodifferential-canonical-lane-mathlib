import canonicalLaneMathlib.AdmissibleClass
import BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean.AdmissibleClass
import BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean.PDEExistencePackage

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean

structure EllipticRegularityPackage {M : Type u} [TopologicalSpace M]
    {P : PseudodifferentialOperatorPackage M} {B : BoundaryValueProblemPackage P}
    (E : PDEExistencePackage B) where
  interiorRegularity : Prop
  boundaryRegularity : Prop
  schauderEstimates : Prop
  gainOfSmoothness : Prop

structure EllipticRegularityEvidence {M : Type u} [TopologicalSpace M]
    {P : PseudodifferentialOperatorPackage M} {B : BoundaryValueProblemPackage P}
    {E : PDEExistencePackage B} (R : EllipticRegularityPackage E) where
  interiorRegularityClosed : R.interiorRegularity
  boundaryRegularityClosed : R.boundaryRegularity
  schauderEstimatesClosed : R.schauderEstimates
  gainOfSmoothnessClosed : R.gainOfSmoothness

def EllipticRegularityClosed {M : Type u} [TopologicalSpace M]
    {P : PseudodifferentialOperatorPackage M} {B : BoundaryValueProblemPackage P}
    {E : PDEExistencePackage B} (R : EllipticRegularityPackage E) : Prop :=
  R.interiorRegularity ∧ R.boundaryRegularity ∧ R.schauderEstimates ∧ R.gainOfSmoothness

theorem elliptic_regularity_closed_from_evidence
    {M : Type u} [TopologicalSpace M] {P : PseudodifferentialOperatorPackage M}
    {B : BoundaryValueProblemPackage P} {E : PDEExistencePackage B}
    (R : EllipticRegularityPackage E) (Ev : EllipticRegularityEvidence R) :
    EllipticRegularityClosed R := by
  exact And.intro Ev.interiorRegularityClosed
    (And.intro Ev.boundaryRegularityClosed
      (And.intro Ev.schauderEstimatesClosed Ev.gainOfSmoothnessClosed))

end BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean
end HautevilleHouse