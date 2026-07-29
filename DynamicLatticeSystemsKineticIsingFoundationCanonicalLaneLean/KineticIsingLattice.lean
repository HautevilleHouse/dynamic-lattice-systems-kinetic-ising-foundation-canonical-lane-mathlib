import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Fin.Basic

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean

structure TwoDimensionalSquareLattice where
  sites : Type u
  adjacency : sites → sites → Prop
  isFinite : Fintype sites
  boundary : Set sites

structure KineticIsingConfiguration (L : TwoDimensionalSquareLattice) where
  spin : L.sites → ℤ
  spinSquare : ∀ s : L.sites, spin s = 1 ∨ spin s = -1

def kineticIsingBasicHamiltonian {L : TwoDimensionalSquareLattice} (config : KineticIsingConfiguration L) : ℝ :=
  -∑ s₁ s₂, if L.adjacency s₁ s₂ then (config.spin s₁ : ℝ) * (config.spin s₂ : ℝ) else 0

theorem ising_hamiltonian_bounded {L : TwoDimensionalSquareLattice} (config : KineticIsingConfiguration L) :
    |kineticIsingBasicHamiltonian config| ≤ (Fintype.card L.sites : ℝ) := by
  have hspin : ∀ s : L.sites, (config.spin s : ℝ) = 1 ∨ (config.spin s : ℝ) = -1 := by
    intro s
    rcases config.spinSquare s with (h | h)
    · left; exact_mod_cast h
    · right; exact_mod_cast h
  have hprod : ∀ s₁ s₂ : L.sites, |(config.spin s₁ : ℝ) * (config.spin s₂ : ℝ)| ≤ 1 := by
    intro s₁ s₂
    rcases hspin s₁ with (h1 | h1)
    · rcases hspin s₂ with (h2 | h2)
      · simp [h1, h2]
      · simp [h1, h2]
    · rcases hspin s₂ with (h2 | h2)
      · simp [h1, h2]
      · simp [h1, h2]
  have hcard : (Fintype.card L.sites : ℝ) ≥ 0 := by norm_num
  calc
    |kineticIsingBasicHamiltonian config| = |∑ s₁ s₂ : L.sites, -(if L.adjacency s₁ s₂ then (config.spin s₁ : ℝ) * (config.spin s₂ : ℝ) else 0)| := rfl
    _ = |∑ s₁ s₂ : L.sites, if L.adjacency s₁ s₂ then -(config.spin s₁ : ℝ) * (config.spin s₂ : ℝ) else 0| := by
      simp [neg_mul, mul_comm, mul_left_comm, mul_assoc]
    _ ≤ ∑ s₁ s₂ : L.sites, |if L.adjacency s₁ s₂ then -(config.spin s₁ : ℝ) * (config.spin s₂ : ℝ) else 0| := by
      apply abs_sum_le_sum_abs
    _ ≤ ∑ s₁ s₂ : L.sites, |(config.spin s₁ : ℝ) * (config.spin s₂ : ℝ)| := by
      refine Finset.sum_le_sum ?_
      intro s₁ h₁
      intro s₂ h₂
      split_ifs with h
      · simp [abs_neg, mul_comm]
      · simp
    _ ≤ ∑ s₁ s₂ : L.sites, (1 : ℝ) := by
      refine Finset.sum_le_sum ?_
      intro s₁ h₁
      intro s₂ h₂
      exact hprod s₁ s₂
    _ = (Fintype.card L.sites : ℝ)^2 := by simp
    _ ≤ (Fintype.card L.sites : ℝ) := by
      have hcard' : (Fintype.card L.sites : ℝ) ≥ 1 := by
        by_contra h
        have hpos : Fintype.card L.sites > 0 := by
          apply Fintype.card_pos.mpr
          have : Nonempty L.sites := by
            have hcardpos : Fintype.card L.sites > 0 := by
              apply Fintype.card_pos.mpr
              exact ⟨by
                have hnonempty : Nonempty L.sites := by
                  refine Fintype.card_pos.mp ?_
                  exact hcardpos
                exact hnonempty⟩
            exact hcardpos
          exact this
        have : (Fintype.card L.sites : ℝ) ≥ 1 := by
          exact_mod_cast hpos
        nlinarith
      nlinarith
    _ ≤ (Fintype.card L.sites : ℝ) := by nlinarith

end DynamicLatticeSystemsKineticIsingFoundationCanonicalLaneLean
end HautevilleHouse