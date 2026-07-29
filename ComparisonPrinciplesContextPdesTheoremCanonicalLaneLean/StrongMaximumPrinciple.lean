import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean

structure StrongMaximumPrinciplePackage {L : ParabolicOperator} (P : ParabolicComparisonPrinciplePackage L) where
  strongComparisonHolds : Prop
  interiorMaximumConstant : Prop
  hopfLemma : Prop

structure StrongMaximumPrincipleEvidence {L : ParabolicOperator} {P : ParabolicComparisonPrinciplePackage L} (S : StrongMaximumPrinciplePackage P) where
  strongComparisonHoldsClosed : S.strongComparisonHolds
  interiorMaximumConstantClosed : S.interiorMaximumConstant
  hopfLemmaClosed : S.hopfLemma

def StrongMaximumPrincipleClosed {L : ParabolicOperator} {P : ParabolicComparisonPrinciplePackage L} (S : StrongMaximumPrinciplePackage P) : Prop :=
  S.strongComparisonHolds ∧ S.interiorMaximumConstant ∧ S.hopfLemma

theorem strong_maximum_principle_closed_from_evidence {L : ParabolicOperator} {P : ParabolicComparisonPrinciplePackage L} (S : StrongMaximumPrinciplePackage P) (E : StrongMaximumPrincipleEvidence S) : StrongMaximumPrincipleClosed S := by
  exact And.intro E.strongComparisonHoldsClosed (And.intro E.interiorMaximumConstantClosed E.hopfLemmaClosed)

end ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean
end HautevilleHouse