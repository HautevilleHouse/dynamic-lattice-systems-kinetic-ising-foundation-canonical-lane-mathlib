import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean.KineticIsingLattice

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean

structure KramersWannierDualityPackage {L : TwoDimensionalSquareLattice} where
  dualLattice : TwoDimensionalSquareLattice
  partitionFunctionRelation : Prop
  criticalTemperatureIdentified : Prop

structure KramersWannierDualityEvidence {L : TwoDimensionalSquareLattice}
    (KW : KramersWannierDualityPackage L) where
  partitionFunctionRelationClosed : KW.partitionFunctionRelation
  criticalTemperatureIdentifiedClosed : KW.criticalTemperatureIdentified

def KramersWannierDualityClosed {L : TwoDimensionalSquareLattice}
    (KW : KramersWannierDualityPackage L) : Prop :=
  KW.partitionFunctionRelation ∧ KW.criticalTemperatureIdentified

theorem kramers_wannier_duality_closed_from_evidence
    {L : TwoDimensionalSquareLattice} (KW : KramersWannierDualityPackage L)
    (E : KramersWannierDualityEvidence KW) : KramersWannierDualityClosed KW := by
  exact And.intro E.partitionFunctionRelationClosed E.criticalTemperatureIdentifiedClosed

end DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean
end HautevilleHouse