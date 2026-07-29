import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean

structure SpinFlipKernel where
  flipRate : Type u
  detailedBalance : Prop
  positivity : Prop
  locality : Prop

def kernelClosed (K : SpinFlipKernel) : Prop :=
  K.detailedBalance ∧ K.positivity ∧ K.locality

structure Site where
  index : Type
  spin : Type
  spinValue : spin → ℝ

def siteAttachedToLattice (s : Site) : Prop := True

end DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean
end HautevilleHouse