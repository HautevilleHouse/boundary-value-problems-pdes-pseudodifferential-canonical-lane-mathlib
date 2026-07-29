import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesPseudodifferential

structure CalderonProjectorCondition where
  boundaryOperator : Type u
  cauchyDataSpace : Type v
  projectionProperty : Prop
  complementsTraceSpace : Prop

structure CalderonProjectorEvidence (C : CalderonProjectorCondition) where
  projectionPropertyClosed : C.projectionProperty
  complementsTraceSpaceClosed : C.complementsTraceSpace

def CalderonProjectorClosed (C : CalderonProjectorCondition) : Prop :=
  C.projectionProperty ∧ C.complementsTraceSpace

theorem calderon_projector_closed_from_evidence (C : CalderonProjectorCondition)
    (Ev : CalderonProjectorEvidence C) : CalderonProjectorClosed C := by
  exact And.intro Ev.projectionPropertyClosed Ev.complementsTraceSpaceClosed

end BoundaryValueProblemsPdesPseudodifferential
end HautevilleHouse