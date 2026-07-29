import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean

structure HarnackPackage where
  harnackConstant : ℝ
  inequalityHolds : Prop
  scaleInvariance : Prop
  positivityCondition : Prop

structure HarnackEvidence (H : HarnackPackage) where
  inequalityHoldsClosed : H.inequalityHolds
  scaleInvarianceClosed : H.scaleInvariance
  positivityConditionClosed : H.positivityCondition

def HarnackClosed (H : HarnackPackage) : Prop :=
  H.inequalityHolds ∧ H.scaleInvariance ∧ H.positivityCondition

theorem harnack_closed_from_evidence (H : HarnackPackage)
    (E : HarnackEvidence H) : HarnackClosed H := by
  exact And.intro E.inequalityHoldsClosed
    (And.intro E.scaleInvarianceClosed E.positivityConditionClosed)

end ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean
end HautevilleHouse