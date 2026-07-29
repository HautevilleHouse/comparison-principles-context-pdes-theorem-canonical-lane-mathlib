import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean

structure HolderRegularityPackage {P : ComparisonPrinciplePDEPackage}
    {M : MaximumPrinciplePackage P} {V : ViscositySolutionPackage P} where
  holderContinuityEstimate : Prop
  interiorRegularity : Prop
  boundaryRegularity : Prop
  schauderEstimate : Prop
  compactnessArgument : Prop

structure HolderRegularityEvidence {P : ComparisonPrinciplePDEPackage}
    {M : MaximumPrinciplePackage P} {V : ViscositySolutionPackage P}
    (H : HolderRegularityPackage P M V) where
  holderContinuityEstimateClosed : H.holderContinuityEstimate
  interiorRegularityClosed : H.interiorRegularity
  boundaryRegularityClosed : H.boundaryRegularity
  schauderEstimateClosed : H.schauderEstimate
  compactnessArgumentClosed : H.compactnessArgument

def HolderRegularityClosed {P : ComparisonPrinciplePDEPackage}
    {M : MaximumPrinciplePackage P} {V : ViscositySolutionPackage P}
    (H : HolderRegularityPackage P M V) : Prop :=
  H.holderContinuityEstimate ∧ H.interiorRegularity ∧ H.boundaryRegularity ∧ H.schauderEstimate ∧ H.compactnessArgument

theorem holder_regularity_closed_from_evidence
    {P : ComparisonPrinciplePDEPackage} {M : MaximumPrinciplePackage P} {V : ViscositySolutionPackage P}
    (H : HolderRegularityPackage P M V) (E : HolderRegularityEvidence H) :
    HolderRegularityClosed H :=
  And.intro E.holderContinuityEstimateClosed
    (And.intro E.interiorRegularityClosed
      (And.intro E.boundaryRegularityClosed
        (And.intro E.schauderEstimateClosed E.compactnessArgumentClosed)))

end ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean
end HautevilleHouse