import DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean.RateKernel

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean

structure LatticeSpinConfig (Λ : Type u) where
  spin : Λ → ℤ₂
  finiteSupport : Finset Λ
  configEquality : DecidableEq (Λ → ℤ₂)

def spinFlip (σ : LatticeSpinConfig Λ) (x : Λ) : LatticeSpinConfig Λ :=
  { σ with spin := fun y => if y = x then -σ.spin y else σ.spin y,
    finiteSupport := insert x σ.finiteSupport }

end DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean
end HautevilleHouse