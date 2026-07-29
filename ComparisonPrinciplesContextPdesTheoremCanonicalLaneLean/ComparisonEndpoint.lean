import ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean.HarnackInequality

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean

structure ComparisonEndpointPackage {G : PDEBackgroundPackage} {M : MaxPrinciplePDEPackage G} {B : BarrierConstructionPackage M} {H : HarnackInequalityPackage B} where
  uniquenessResult : Prop
  continuousDependence : Prop
  stabilityEstimate : Prop

structure ComparisonEndpointEvidence {G : PDEBackgroundPackage} {M : MaxPrinciplePDEPackage G} {B : BarrierConstructionPackage M} {H : HarnackInequalityPackage B} (C : ComparisonEndpointPackage H) where
  uniquenessResultClosed : C.uniquenessResult
  continuousDependenceClosed : C.continuousDependence
  stabilityEstimateClosed : C.stabilityEstimate

def ComparisonEndpointClosed {G : PDEBackgroundPackage} {M : MaxPrinciplePDEPackage G} {B : BarrierConstructionPackage M} {H : HarnackInequalityPackage B} (C : ComparisonEndpointPackage H) : Prop :=
  C.uniquenessResult ∧ C.continuousDependence ∧ C.stabilityEstimate

theorem comparison_endpoint_closed_from_evidence
    {G : PDEBackgroundPackage} {M : MaxPrinciplePDEPackage G} {B : BarrierConstructionPackage M} {H : HarnackInequalityPackage B} (C : ComparisonEndpointPackage H) (E : ComparisonEndpointEvidence C) :
    ComparisonEndpointClosed C := by
  exact And.intro E.uniquenessResultClosed (And.intro E.continuousDependenceClosed E.stabilityEstimateClosed)

end ComparisonPrinciplesContextPdesTheoremCanonicalLaneLean
end HautevilleHouse
