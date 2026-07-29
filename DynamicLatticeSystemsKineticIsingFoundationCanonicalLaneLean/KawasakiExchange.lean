import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean

structure KawasakiExchangePackage where
  exchangeRate : Type u
  conservationLaw : Prop
  detailedBalance : Prop
  ergodicity : Prop

def kawasakiExchangeClosed (K : KawasakiExchangePackage) : Prop :=
  K.conservationLaw ∧ K.detailedBalance ∧ K.ergodicity

theorem kawasaki_exchange_closed_iff (K : KawasakiExchangePackage) :
  kawasakiExchangeClosed K := by
  exact And.intro K.conservationLaw (And.intro K.detailedBalance K.ergodicity)

end DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean
end HautevilleHouse