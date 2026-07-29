import canonicalLaneMathlib.AdmissibleClass

/-!
# Local Comparison Estimates Package
-/

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean

structure LocalComparisonEstimatesPackage where
  localComparisonEstimate : Prop
  gradientEstimate : Prop
  timeContinuityEstimate : Prop
  pinningCondition : Prop

structure LocalComparisonEstimatesEvidence (L : LocalComparisonEstimatesPackage) where
  localComparisonEstimateClosed : L.localComparisonEstimate
  gradientEstimateClosed : L.gradientEstimate
  timeContinuityEstimateClosed : L.timeContinuityEstimate
  pinningConditionClosed : L.pinningCondition

def LocalComparisonEstimatesClosed (L : LocalComparisonEstimatesPackage) : Prop :=
  L.localComparisonEstimate ∧ L.gradientEstimate ∧
  L.timeContinuityEstimate ∧ L.pinningCondition

theorem local_comparison_estimates_closed_from_evidence
    (L : LocalComparisonEstimatesPackage)
    (E : LocalComparisonEstimatesEvidence L) : LocalComparisonEstimatesClosed L := by
  exact And.intro E.localComparisonEstimateClosed
    (And.intro E.gradientEstimateClosed
      (And.intro E.timeContinuityEstimateClosed E.pinningConditionClosed))

end ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean
end HautevilleHouse