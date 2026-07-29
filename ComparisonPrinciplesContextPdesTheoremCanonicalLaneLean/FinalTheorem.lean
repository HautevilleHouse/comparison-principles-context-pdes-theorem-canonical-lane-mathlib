import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean

def ConstrainedComparisonPrinciplesClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_comparison_principles_endgame (A : AdmissibleClass) :
    ConstrainedComparisonPrinciplesClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean
end HautevilleHouse