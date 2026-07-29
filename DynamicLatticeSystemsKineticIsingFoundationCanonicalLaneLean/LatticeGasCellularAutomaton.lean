import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean

structure LatticeGasCellularAutomatonPackage where
  latticeType : Type u
  stateSpace : Type v
  updateRule : Type w
  localTransition : Prop
  reversibility : Prop
  conservationLaws : Prop

def latticeGasCellularAutomatonClosed (L : LatticeGasCellularAutomatonPackage) : Prop :=
  L.localTransition ∧ L.reversibility ∧ L.conservationLaws

theorem lattice_gas_cellular_automaton_closed_iff (L : LatticeGasCellularAutomatonPackage) :
  latticeGasCellularAutomatonClosed L := by
  exact And.intro L.localTransition (And.intro L.reversibility L.conservationLaws)

end DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean
end HautevilleHouse