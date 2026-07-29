import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean

structure BVPAdmittedObject where
  domain : Type
  topology : TopologicalSpace domain
  boundary : Set domain
  operator : Type
  boundaryCondition : Prop
  wellPosed : Prop
  conclusion : wellPosed

def BVPWitnessClosed (O : BVPAdmittedObject) : Prop :=
  O.wellPosed

end BoundaryValueProblemsPdesPseudodifferentialCanonicalLaneLean
end HautevilleHouse
