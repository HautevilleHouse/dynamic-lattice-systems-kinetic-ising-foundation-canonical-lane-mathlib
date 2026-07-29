import DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean.LatticeSpinConfig

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean

structure RateKernel (Λ : Type u) where
  siteRate : Λ → (LatticeSpinConfig Λ) → ℝ
  nonnegativity : ∀ x σ, siteRate x σ ≥ 0
  detailedBalanceCondition : Prop
  finiteRangeCondition : Prop

def rateKernelClosed (K : RateKernel Λ) : Prop :=
  K.nonnegativity K.detailedBalanceCondition

end DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean
end HautevilleHouse