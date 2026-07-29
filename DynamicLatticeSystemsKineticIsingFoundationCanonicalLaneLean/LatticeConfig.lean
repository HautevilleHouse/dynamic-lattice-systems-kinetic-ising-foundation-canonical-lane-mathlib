import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean

structure LatticeSite where
  index : ℕ
  position : ℤ × ℤ

structure LatticeConfig where
  sites : List LatticeSite
  bondSet : List (ℕ × ℕ)
  dimension : ℕ
  boundaryCondition : Prop
  finiteVolume : Prop

structure SpinVariable (T : Type) where
  val : T → ℤ
  flip : T → SpinVariable T

structure DynamicLattice (T : Type) where
  config : LatticeConfig
  spin : SpinVariable T
  localEnergy : T → ℤ
  totalEnergy : ℤ
  flipEnergyCost : T → ℤ

end DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean
end HautevilleHouse