import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean

structure LatticeSpinDomain where
  siteType : Type u
  latticeGraph : siteType → siteType → Prop
  spinValue : siteType → ℤ
  finiteLattice : Finset siteType
  nearestNeighborSymmetric : ∀ i j, latticeGraph i j → latticeGraph j i

structure LatticeSpinDomainEvidence (L : LatticeSpinDomain) where
  finiteLatticeClosed : L.finiteLattice = L.finiteLattice
  nearestNeighborSymmetricClosed : ∀ i j, L.latticeGraph i j → L.latticeGraph j i

def LatticeSpinDomainClosed (L : LatticeSpinDomain) : Prop :=
  L.finiteLattice = L.finiteLattice ∧ (∀ i j, L.latticeGraph i j → L.latticeGraph j i)

theorem lattice_spin_domain_closed_from_evidence (L : LatticeSpinDomain) (E : LatticeSpinDomainEvidence L) :
    LatticeSpinDomainClosed L := by
  exact And.intro E.finiteLatticeClosed E.nearestNeighborSymmetricClosed

end DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean
end HautevilleHouse