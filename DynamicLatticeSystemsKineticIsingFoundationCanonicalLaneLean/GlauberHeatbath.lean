import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean.LatticeSpinDomain
import HautevilleHouse.DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean.KineticIsingDynamics

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean

structure GlauberHeatbath {L : LatticeSpinDomain} (K : KineticIsingDynamics L) where
  flipRateFormula : L.siteType → ℝ
  flipRateFormulaDefined : ∀ i, K.flipRate i = flipRateFormula i
  heatbathCondition : ∀ i, flipRateFormula i = 1 / (1 + Real.exp (-2 * (L.spinValue i)))

structure GlauberHeatbathEvidence {L : LatticeSpinDomain} {K : KineticIsingDynamics L} (G : GlauberHeatbath K) where
  flipRateFormulaDefinedClosed : ∀ i, K.flipRate i = G.flipRateFormula i
  heatbathConditionClosed : ∀ i, G.flipRateFormula i = 1 / (1 + Real.exp (-2 * (L.spinValue i)))

def GlauberHeatbathClosed {L : LatticeSpinDomain} {K : KineticIsingDynamics L} (G : GlauberHeatbath K) : Prop :=
  (∀ i, K.flipRate i = G.flipRateFormula i) ∧ (∀ i, G.flipRateFormula i = 1 / (1 + Real.exp (-2 * (L.spinValue i))))

theorem glauber_heatbath_closed_from_evidence {L : LatticeSpinDomain} {K : KineticIsingDynamics L} (G : GlauberHeatbath K) (E : GlauberHeatbathEvidence G) :
    GlauberHeatbathClosed G := by
  exact And.intro E.flipRateFormulaDefinedClosed E.heatbathConditionClosed

end DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean
end HautevilleHouse