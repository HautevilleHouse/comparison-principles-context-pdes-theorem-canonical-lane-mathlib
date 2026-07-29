import canonicalLaneMathlib.AdmissibleClass

/-!
# Endpoint Comparison Closure Package
-/

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean

structure EndpointComparisonClosurePackage where
  finalComparisonResult : Prop
  endpointSatisfied : Prop
  remainderRecorded : Prop
  closureAchieved : Prop

structure EndpointComparisonClosureEvidence (E : EndpointComparisonClosurePackage) where
  finalComparisonResultClosed : E.finalComparisonResult
  endpointSatisfiedClosed : E.endpointSatisfied
  remainderRecordedClosed : E.remainderRecorded
  closureAchievedClosed : E.closureAchieved

def EndpointComparisonClosureClosed (E : EndpointComparisonClosurePackage) : Prop :=
  E.finalComparisonResult ∧ E.endpointSatisfied ∧
  E.remainderRecorded ∧ E.closureAchieved

theorem endpoint_comparison_closure_closed_from_evidence
    (E : EndpointComparisonClosurePackage)
    (Ev : EndpointComparisonClosureEvidence E) : EndpointComparisonClosureClosed E := by
  exact And.intro Ev.finalComparisonResultClosed
    (And.intro Ev.endpointSatisfiedClosed
      (And.intro Ev.remainderRecordedClosed Ev.closureAchievedClosed))

end ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean
end HautevilleHouse